From: Conor Dooley <conor@kernel.org>
Date: Wed, 19 Jun 2024 18:31:22 +0100
Subject: [PATCH 2/5] riscv: add parsing for Zaamo and Zalrsc extensions
In-Reply-To: <20240619153913.867263-3-cleger@rivosinc.com>
References: <20240619153913.867263-1-cleger@rivosinc.com>
 <20240619153913.867263-3-cleger@rivosinc.com>
Message-ID: <20240619-fernlike-pang-b7e589a9c342@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 19, 2024 at 05:39:09PM +0200, Cl?ment L?ger wrote:
> These 2 new extensions are actually a subset of the A extension which
> provides atomic memory operations and load-reserved/store-conditional
> instructions.

I wish this silly degree of fragmentation didn't exist.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240619/6fc1efdd/attachment.sig>
