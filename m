From: Eric Biggers <ebiggers@kernel.org>
Date: Sat, 20 Jan 2024 17:13:41 -0800
Subject: [PATCH -next v21 23/27] riscv: detect assembler support for
 .option arch
In-Reply-To: <20230605110724.21391-24-andy.chiu@sifive.com>
References: <20230605110724.21391-1-andy.chiu@sifive.com>
 <20230605110724.21391-24-andy.chiu@sifive.com>
Message-ID: <20240121011341.GA97368@sol.localdomain>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Andy,

On Mon, Jun 05, 2023 at 11:07:20AM +0000, Andy Chiu wrote:
> +config AS_HAS_OPTION_ARCH
> +	# https://reviews.llvm.org/D123515
> +	def_bool y
> +	depends on $(as-instr, .option arch$(comma) +m)
> +	depends on !$(as-instr, .option arch$(comma) -i)

With tip-of-tree clang (llvm-project commit 85a8e5c3e0586e85), I'm seeing
AS_HAS_OPTION_ARCH be set to n.  It's the second "depends on" that makes it be
set to n, so apparently clang started accepting ".option arch -i".  What was
your intent here for checking that ".option arch -i" is not supported?  I'd
think that just the first "depends on" would be sufficient.

- Eric

