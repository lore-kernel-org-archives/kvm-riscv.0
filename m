From: Zenghui Yu <yuzenghui@huawei.com>
Date: Thu, 7 Dec 2023 19:19:47 +0800
Subject: [PATCH 2/5] KVM: selftests: aarch64: Remove redundant newlines
In-Reply-To: <20231206170241.82801-9-ajones@ventanamicro.com>
References: <20231206170241.82801-7-ajones@ventanamicro.com>
 <20231206170241.82801-9-ajones@ventanamicro.com>
Message-ID: <3af8d9f4-96f6-568b-32f7-114c8346b199@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2023/12/7 1:02, Andrew Jones wrote:
> TEST_* functions append their own newline. Remove newlines from
> TEST_* callsites to avoid extra newlines in output.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Acked-by: Zenghui Yu <yuzenghui@huawei.com>

