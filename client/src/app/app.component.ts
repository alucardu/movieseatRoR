import { Component }          from '@angular/core';
import { AppService }         from "./app.service";
import { Movie }              from './movie';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
  providers: [AppService]
})

export class AppComponent {
  title = 'app works!';
  errorMessage: string;
  movies: Movie[];
  mode = 'Observable';

  constructor(private  appService: AppService){}

  ngOnInit(){
    this.getMovies();
  }

  getMovies(){
    this.appService.getMovies()
      .subscribe((response)=>{
        this.movies = response;
      });
  }
}
