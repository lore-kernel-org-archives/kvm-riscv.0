From: Christoph Hellwig <hch@infradead.org>
Date: Sun, 1 Oct 2023 23:27:00 -0700
Subject: [PATCH 1/7] RISC-V: Detect XVentanaCondOps from ISA string
In-Reply-To: <20230919035343.1399389-2-apatel@ventanamicro.com>
References: <20230919035343.1399389-1-apatel@ventanamicro.com>
 <20230919035343.1399389-2-apatel@ventanamicro.com>
Message-ID: <ZRpitP5y1yhzKwbE@infradead.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 19, 2023 at 09:23:37AM +0530, Anup Patel wrote:
> The Veyron-V1 CPU supports custom conditional arithmetic and
> conditional-select/move operations referred to as XVentanaCondOps
> extension. In fact, QEMU RISC-V also has support for emulating
> XVentanaCondOps extension.
> 
> Let us detect XVentanaCondOps extension from ISA string available
> through DT or ACPI.

Umm, I though Linux/riscv would never support vendor specific
extensions?


