import express from 'express';
const app = express();
app.use(express.json());
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`🚀 Server is running on http://localhost:${PORT}`);
    console.log(`TypeScript app started in ${process.env.NODE_ENV || 'development'} mode.`);
});
//# sourceMappingURL=index.js.map