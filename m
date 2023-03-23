From: Björn Töpel <bjorn@kernel.org>
Date: Thu, 23 Mar 2023 11:29:37 +0100
Subject: [PATCH -next v15 10/19] riscv: Allocate user's vector context
 in the first-use trap
In-Reply-To: <20230317113538.10878-11-andy.chiu@sifive.com>
Message-ID: <87edpf4v72.fsf@all.your.base.are.belong.to.us>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Andy Chiu <andy.chiu@sifive.com> writes:

> Vector unit is disabled by default for all user processes. Thus, a
> process will take a trap (illegal instruction) into kernel at the first
> time when it uses Vector. Only after then, the kernel allocates V
> context and starts take care of the context for that user process.
>
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Link: https://lore.kernel.org/r/3923eeee-e4dc-0911-40bf-84c34aee962d at linaro.org
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>

Reviewed-by: Bj?rn T?pel <bjorn@rivosinc.com>

