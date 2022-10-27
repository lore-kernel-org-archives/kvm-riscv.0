From: Heiko Stübner <heiko@sntech.de>
Date: Thu, 27 Oct 2022 16:58:39 +0200
Subject: [PATCH 1/9] RISC-V: Factor out body of riscv_init_cbom_blocksize loop
In-Reply-To: <20221027130247.31634-2-ajones@ventanamicro.com>
References: <20221027130247.31634-1-ajones@ventanamicro.com> <20221027130247.31634-2-ajones@ventanamicro.com>
Message-ID: <5204122.31r3eYUQgx@diego>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Am Donnerstag, 27. Oktober 2022, 15:02:39 CEST schrieb Andrew Jones:
> Refactor riscv_init_cbom_blocksize() to prepare for it to be used
> for both cbom block size and cboz block size.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



