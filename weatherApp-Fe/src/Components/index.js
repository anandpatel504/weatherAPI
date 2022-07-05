import React, { Component } from "react";
import { MDBCard } from "mdbreact";
import "@fortawesome/fontawesome-free/css/all.min.css";
import "bootstrap-css-only/css/bootstrap.min.css";
import "mdbreact/dist/css/mdb.css";
import axios from "axios";
import Chart from "react-apexcharts";
import swal from "sweetalert";

class currentWeather extends React.Component {
  state = { redirect: "" };
  onSubmithandler = (e) => {
    e.preventDefault();
    const name = e.target.cityname.value;
    this.getState(name);
    e.target.reset();
  };

  state = {
    options: {},
    series: [],
  };

  getState = (name) => {
    axios
      .get(`http://localhost:2022/cityName?name=${name}`)
      .then((data) => {
        if (data.data.statusCode === 404) {
          swal("This City is not found!", "", "error");
        } else {
          var name = data.data[0].name;
          var region = data.data[0].region;
          var country = data.data[0].country;
          var time = data.data[0].localtime;
          var condition = data.data[0].current_status.condition.text;
          var temp_c = parseInt(data.data[0]["current_status"].temp_c);
          var temp_f = parseInt(data.data[0]["current_status"].temp_f);
          var wind_mph = parseInt(data.data[0]["current_status"].wind_mph);
          var wind_kph = parseInt(data.data[0]["current_status"].wind_kph);
          var humidity = parseInt(data.data[0]["current_status"].humidity);
          var cloud = parseInt(data.data[0]["current_status"].cloud);
          console.log(condition, time, "condition");
        }

        this.setState({
          cityData: { name, region, country, time, condition },
          options: {
            chart: {
              id: "apexchart-example",
            },
            xaxis: {
              categories: [
                "temp_c",
                "temp_f",
                "humidity",
                "cloud",
                "wind_mph",
                "wind_kph",
                "temp_c",
              ],
            },
          },
          series: [
            {
              name: "weather",
              data: [temp_c, temp_f, humidity, cloud, wind_mph, wind_kph],
            },
          ],
        });
      })
      .catch((error) => {
        console.log(error, "Hello error!!");
      });
  };

  render() {
    return (
      <div>
        <br></br>
        <div className="OuterContainer">
          {this.state.redirect}
          <div className="InnerContainer">
            <h1 className="heading">Check your weather</h1>
            <form onSubmit={this.onSubmithandler}>
              <div>
                <input
                  placeholder="City Name"
                  name="cityname"
                  className="locationName"
                  type="text"
                  required
                />
              </div>
              <button className="button mt-20" type="submit">
                Search
              </button>
            </form>
            <br></br>
            <MDBCard>
              {/* <div className="main-chart"> */}
              <h3 className="mt-3">Current weather status</h3>
              <div className="d-flex ml-auto mr-auto ">
                <h6 className="ml-2">{this.state.cityData?.name},</h6>
                <h6 className="ml-2">{this.state.cityData?.region},</h6>
                <h6 className="ml-2">{this.state.cityData?.country},</h6>
                <h6 className="ml-2">
                  Condition:- {this.state.cityData?.condition}
                </h6>
              </div>
              <div className="chart-data">
                <Chart
                  options={this.state.options}
                  series={this.state.series}
                  type="bar"
                  width={500}
                  height={320}
                />
              </div>
              {/* </div> */}
            </MDBCard>
          </div>
        </div>
      </div>
    );
  }
}

export default currentWeather;
