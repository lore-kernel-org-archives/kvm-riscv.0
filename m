From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 15 Jan 2024 16:56:16 +0100
Subject: [PATCH 11/15] KVM: riscv: selftests: Add Zihintntl extension to
 get-reg-list test
In-Reply-To: <20231128145357.413321-12-apatel@ventanamicro.com>
References: <20231128145357.413321-1-apatel@ventanamicro.com>
 <20231128145357.413321-12-apatel@ventanamicro.com>
Message-ID: <20240115-6c4b2f1b0c692b6b8e609ab4@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 28, 2023 at 08:23:53PM +0530, Anup Patel wrote:
> The KVM RISC-V allows Zihintntl extension for Guest/VM so let us
> add this extension to get-reg-list test.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
>  1 file changed, 4 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

