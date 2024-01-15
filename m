From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 15 Jan 2024 16:37:14 +0100
Subject: [PATCH 05/15] KVM: riscv: selftests: Add scaler crypto
 extensions to get-reg-list test
In-Reply-To: <20231128145357.413321-6-apatel@ventanamicro.com>
References: <20231128145357.413321-1-apatel@ventanamicro.com>
 <20231128145357.413321-6-apatel@ventanamicro.com>
Message-ID: <20240115-c690768430c76a2e595a7c86@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 28, 2023 at 08:23:47PM +0530, Anup Patel wrote:
> The KVM RISC-V allows scaler crypto extensions for Guest/VM so let us
> add these extensions to get-reg-list test. This includes extensions
> Zbkb, Zbkc, Zbkx, Zknd, Zkne, Zknh, Zkr, Zksed, Zksh, and Zkt.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  .../selftests/kvm/riscv/get-reg-list.c        | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)


Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

