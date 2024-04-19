From: Conor Dooley <conor@kernel.org>
Date: Fri, 19 Apr 2024 16:22:52 +0100
Subject: [PATCH v2 3/6] riscv: Add Zawrs support for spinlocks
In-Reply-To: <20240419135321.70781-11-ajones@ventanamicro.com>
References: <20240419135321.70781-8-ajones@ventanamicro.com>
 <20240419135321.70781-11-ajones@ventanamicro.com>
Message-ID: <20240419-irate-dispute-2714c42f3a63@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 19, 2024 at 03:53:25PM +0200, Andrew Jones wrote:

> +config RISCV_ISA_ZAWRS
> +	bool "Zawrs extension support for more efficient busy waiting"
> +	depends on RISCV_ALTERNATIVE
> +	default y
> +	help
> +	  The Zawrs extension defines instructions to be used in polling loops
> +	  which allow a hart to enter a low-power state or to trap to the
> +	  hypervisor while waiting on a store to a memory location. Enable the
> +	  use of these instructions in the kernel when the Zawrs extension is
> +	  detected at boot.

Ignoring the rest of the patch, and focusing on the bit relevant to our
other conversation, I think this description satisfies what I was trying
to do with the other options in terms of being clear about what exactly
it does.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240419/555241cd/attachment.sig>
