From: Will Deacon <will@kernel.org>
Date: Mon, 11 Nov 2024 17:10:53 +0000
Subject: [PATCH kvmtool] riscv: Pass correct size to snprintf()
In-Reply-To: <20241104192120.75841-1-bjorn@kernel.org>
References: <20241104192120.75841-1-bjorn@kernel.org>
Message-ID: <173134344938.1668143.13537130235205302790.b4-ty@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 04 Nov 2024 20:21:19 +0100, Bj?rn T?pel wrote:
> The snprintf() function does not get the correct size argument passed,
> when the FDT ISA string is built. Instead of adjusting the size for
> each extension, the full size is passed for every iteration. Doing so
> will make __snprinf_chk() bail out on glibc.
> 
> Adjust size for each iteration.
> 
> [...]

Applied to kvmtool (master), thanks!

[1/1] riscv: Pass correct size to snprintf()
      https://git.kernel.org/will/kvmtool/c/574bd7b432ec

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

