From: Conor Dooley <conor@kernel.org>
Date: Wed, 5 Jul 2023 15:51:45 +0100
Subject: [PATCH] RISC-V: KVM: provide UAPI for host SATP mode
In-Reply-To: <20230705-fondue-bagginess-66c25f1a4135@spud>
References: <20230705091535.237765-1-dbarboza@ventanamicro.com>
 <994ae720-b3a1-1e67-ca9c-ca00e6525488@ghiti.fr>
 <029b87e1-d4bc-9deb-316b-b93c5bd2a37f@ventanamicro.com>
 <20230705-602410a4b627f419f8f9936c@orel>
 <20230705-fondue-bagginess-66c25f1a4135@spud>
Message-ID: <20230705-bogged-remindful-b2ccef9be2ac@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 05, 2023 at 03:44:02PM +0100, Conor Dooley wrote:

> (@Drew, I remember why now that the property is optional - nommu exists)

Wait, no that makes no sense - there's "riscv,none" for that.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230705/cbe6f461/attachment.sig>
