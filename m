From: Conor Dooley <conor.dooley@microchip.com>
Date: Tue, 23 Apr 2024 10:05:41 +0100
Subject: [PATCH v2 2/6] dt-bindings: riscv: Add Zawrs ISA extension
 description
In-Reply-To: <20240423-ed9ddb701be1df4a25e29f31@orel>
References: <20240419135321.70781-8-ajones@ventanamicro.com>
 <20240419135321.70781-10-ajones@ventanamicro.com>
 <20240419-chafe-leotard-e5daee19b1c8@spud>
 <20240419-8c6af6a169a7aa0b9aa5cac5@orel>
 <20240419-disdain-litmus-82874cc4872e@spud>
 <ZiKeYRnXxtLUtkkW@ghost>
 <20240421-f63f90c2146deb0695b84441@orel>
 <ZibmfbLnGCb9gmow@ghost>
 <20240423-ed9ddb701be1df4a25e29f31@orel>
Message-ID: <20240423-bulldog-mace-400ace9e7bde@wendy>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 23, 2024 at 10:46:01AM +0200, Andrew Jones wrote:
> Maybe I'm attempting to document it in the wrong place though. Maybe this
> is more of a Documentation/arch/riscv/boot.rst type of thing.

It might be good to document it there also, but I'd like to avoid being
unable to rely on what firmware tells us is supported because we have a
stricter requirement.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240423/a1265cf9/attachment.sig>
