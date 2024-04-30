From: Conor Dooley <conor.dooley@microchip.com>
Date: Tue, 30 Apr 2024 13:12:32 +0100
Subject: [PATCH v4 02/11] riscv: add ISA extensions validation
In-Reply-To: <dbcf0be9-eae6-4776-bc5b-c6fad58df9c3@rivosinc.com>
References: <20240429150553.625165-1-cleger@rivosinc.com>
 <20240429150553.625165-3-cleger@rivosinc.com>
 <20240429-subtext-tabby-3a1532f058a5@spud>
 <5d5febd5-d113-4e8c-9535-9e75acf23398@rivosinc.com>
 <20240430-payable-famished-6711765d5ca4@wendy>
 <dbcf0be9-eae6-4776-bc5b-c6fad58df9c3@rivosinc.com>
Message-ID: <20240430-gratuity-refinish-29abb136c958@wendy>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 30, 2024 at 01:58:11PM +0200, Cl?ment L?ger wrote:
> Yeah, see what you mean. I think we also need to define if we want to
> expose all the ISA extensions in /proc/cpuinfo (ie no matter the config
> of the kernel) or not. If so, additional validate() callback would make
> sense. If we want to keep the full ISA string in /proc/info, then we
> will need another way of doing so.

If extensions aren't usable, they shouldn't be in /proc/cpuinfo either
as there's programs that parse that to figure out what they can use,
possibly even only checking a single cpu and using that as gospel.
That's why there's that per-hart-isa thing that was added by one of your
colleagues last year.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240430/3c406a08/attachment.sig>
