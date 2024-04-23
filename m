From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 23 Apr 2024 12:56:30 +0200
Subject: [PATCH v8 24/24] KVM: riscv: selftests: Add commandline option
 for SBI PMU test
In-Reply-To: <724a4797-18dc-4011-ba48-445c1cb6a976@collabora.com>
References: <20240420151741.962500-1-atishp@rivosinc.com>
 <20240420151741.962500-25-atishp@rivosinc.com>
 <724a4797-18dc-4011-ba48-445c1cb6a976@collabora.com>
Message-ID: <20240423-b25d0b1540d2092f5370afa5@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 23, 2024 at 02:03:29PM +0500, Muhammad Usama Anjum wrote:
...
> > +	pr_info("Usage: %s [-h] [-d <test name>]\n", name);
> A little weird that we have pr_info named helper to print logs when it is a
> userspace application, not kernel code. I'll check it in the source who
> added it to the KVM tests.
>

It was me, as git-blame will easily show you. Why is it "weird"?
Applications have needs for pr_info-like functions too, and the pr_info
name isn't reserved for the kernel. The only thing weird I see is that
I didn't differentiate pr_debug and pr_info messages. I probably should
have at least given pr_debug output a 'debug:' prefix.

Thanks,
drew

