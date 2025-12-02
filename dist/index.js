import express, {} from 'express';
const PORT = process.env.PORT || 3000;
const app = express();
app.use(express.json());
// app.get('/', (req: Request, res: Response) => {
//     res.status(200).json({
//         message: 'TypeScript ESM Express Server Active!',
//         environment: process.env.NODE_ENV || 'development'
//     });
// });
app.get('/', (req, res) => {
    res.send('Hello!!! - Ken news updated ooo no');
});
app.listen(PORT, () => {
    console.log(`⚡️[server]: Server is running at http://localhost:${PORT}`);
});
