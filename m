From: Janosch Frank <frankja@linux.ibm.com>
Date: Wed, 6 Dec 2023 18:18:22 +0100
Subject: [PATCH 4/5] KVM: selftests: s390x: Remove redundant newlines
In-Reply-To: <20231206170241.82801-11-ajones@ventanamicro.com>
References: <20231206170241.82801-7-ajones@ventanamicro.com>
 <20231206170241.82801-11-ajones@ventanamicro.com>
Message-ID: <387136aa-dfc7-4a1b-a7a6-31c7ecad1013@linux.ibm.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12/6/23 18:02, Andrew Jones wrote:
> TEST_* functions append their own newline. Remove newlines from
> TEST_* callsites to avoid extra newlines in output.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Acked-by: Janosch Frank <frankja@linux.ibm.com>

[...]

