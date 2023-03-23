From: Björn Töpel <bjorn@kernel.org>
Date: Thu, 23 Mar 2023 11:36:31 +0100
Subject: [PATCH -next v15 14/19] riscv: signal: Report signal frame size
 to userspace via auxv
In-Reply-To: <20230317113538.10878-15-andy.chiu@sifive.com>
References: <20230317113538.10878-1-andy.chiu@sifive.com>
 <20230317113538.10878-15-andy.chiu@sifive.com>
Message-ID: <87a6034uvk.fsf@all.your.base.are.belong.to.us>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Andy Chiu <andy.chiu@sifive.com> writes:

> From: Vincent Chen <vincent.chen@sifive.com>
>
> The vector register belongs to the signal context. They need to be stored
> and restored as entering and leaving the signal handler. According to the
> V-extension specification, the maximum length of the vector registers can
> be 2^(XLEN-1). Hence, if userspace refers to the MINSIGSTKSZ to create a
> sigframe, it may not be enough. To resolve this problem, this patch refers
> to the commit 94b07c1f8c39c
> ("arm64: signal: Report signal frame size to userspace via auxv") to enable
> userspace to know the minimum required sigframe size through the auxiliary
> vector and use it to allocate enough memory for signal context.
>
> Note that auxv always reports size of the sigframe as if V exists for
> all starting processes, whenever the kernel has CONFIG_RISCV_ISA_V. The
> reason is that users usually reference this value to allocate an
> alternative signal stack, and the user may use V anytime. So the user
> must reserve a space for V-context in sigframe in case that the signal
> handler invokes after the kernel allocating V.
>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Bj?rn T?pel <bjorn@rivosinc.com>

