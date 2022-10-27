From: Heiko Stübner <heiko@sntech.de>
Date: Thu, 27 Oct 2022 17:37:35 +0200
Subject: [PATCH 3/9] RISC-V: insn-def: Define cbo.zero
In-Reply-To: <20221027130247.31634-4-ajones@ventanamicro.com>
References: <20221027130247.31634-1-ajones@ventanamicro.com> <20221027130247.31634-4-ajones@ventanamicro.com>
Message-ID: <2545978.irdbgypaU6@diego>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Am Donnerstag, 27. Oktober 2022, 15:02:41 CEST schrieb Andrew Jones:
> CBO instructions use the I-type of instruction format where
> the immediate is used to identify the CBO instruction type.
> Add I-type instruction encoding support to insn-def and also
> add cbo.zero.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>




