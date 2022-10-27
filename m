From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 27 Oct 2022 17:42:49 +0200
Subject: [PATCH 2/9] RISC-V: Add Zicboz detection and block size parsing
In-Reply-To: <5176908.GXAFRqVoOG@diego>
References: <20221027130247.31634-1-ajones@ventanamicro.com>
 <20221027130247.31634-3-ajones@ventanamicro.com>
 <5176908.GXAFRqVoOG@diego>
Message-ID: <20221027154249.azksbbscnwt4b2uu@kamzik>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 27, 2022 at 05:03:58PM +0200, Heiko St?bner wrote:
> Am Donnerstag, 27. Oktober 2022, 15:02:40 CEST schrieb Andrew Jones:
...
> > +		cbo_get_block_size(node, "riscv,cboz-block-size",
> 
> This is missing an entry in
> 	Documentation/devicetree/bindings/riscv/cpus.yaml
> for the added riscv,cboz-block-size property.

Thanks for pointing that out. I'll add in v2.

> 
> Otherwise
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Thanks,
drew

