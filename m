From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 31 Mar 2023 22:38:40 +0800
Subject: [PATCH -next v17 10/20] riscv: Allocate user's vector context in
 the first-use trap
In-Reply-To: <3435e5c9-5969-4abc-b929-5a73806e3506@spud>
References: <20230327164941.20491-1-andy.chiu@sifive.com> <20230327164941.20491-11-andy.chiu@sifive.com>
 <3435e5c9-5969-4abc-b929-5a73806e3506@spud>
Message-ID: <CABgGipWEyhct3fQMjZ4+OL7WU-L_TZCDJsJq=GhsH0bn9Az_mA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 29, 2023 at 1:22?AM Conor Dooley <conor@kernel.org> wrote:
>
> On Mon, Mar 27, 2023 at 04:49:30PM +0000, Andy Chiu wrote:
> > Vector unit is disabled by default for all user processes. Thus, a
> > process will take a trap (illegal instruction) into kernel at the first
> > time when it uses Vector. Only after then, the kernel allocates V
> > context and starts take care of the context for that user process.
> >
> > Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> > Link: https://lore.kernel.org/r/3923eeee-e4dc-0911-40bf-84c34aee962d at linaro.org
> > Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
>
> I see you dropped two R-b from this patch, what actually changed here?
> It's not immediately obvious to me (sorry!) and the cover doesn't mention
> why they were dropped.

Hi, the reason why I dropped R-b here is that there is a conflict in
trap.c because the API has changed after converting to generic entry.
And that change does not make v16's way work out of the box, so it
(trap.c @ v17) requires some more reviewing I suppose.

Thanks for asking! I should get better at describing these in the cover letter.

Andy

