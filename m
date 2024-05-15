From: Conor Dooley <conor@kernel.org>
Date: Wed, 15 May 2024 16:47:02 +0100
Subject: [PATCH v4 02/11] riscv: add ISA extensions validation
In-Reply-To: <7a26604f-2653-4140-9294-637b340282d1@rivosinc.com>
References: <20240429150553.625165-1-cleger@rivosinc.com>
 <20240429150553.625165-3-cleger@rivosinc.com>
 <20240514-headcount-shrill-390ac0b9233c@spud>
 <7a26604f-2653-4140-9294-637b340282d1@rivosinc.com>
Message-ID: <20240515-bucktooth-squiggly-4facfc989f28@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 15, 2024 at 03:26:23PM +0200, Cl?ment L?ger wrote:
> > This function is badly in need of some new variable names for the first
> > two parameters. It's hard to follow what each of them is meant to be
> > once you're inside this function and removed from their definitions.
> > The first parameter is the source bitmap that we've already filled from
> > the dt/acpi scan of that hart and the second is the per-hart data
> > structure that we're gonna assign it to and keep "forever", I think the
> > naming should reflect that.
> 
> Yeah, wasn't sure of the naming at all. Would you be ok with the following:
> 
> - source_isa: Input ISA bitmap parsed from ISA string (DT/ACPI)
> - resolved_isa: Output ISA bitmap resolved from the first one
> (configuration and extension dependencies matching).
> 
> Since I'm a non-native english speaker, I'm not sure at all if it
> correctly means what they do, feel free to tell me if you have some
> better options.

I think those are fine, thanks.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240515/3385e949/attachment.sig>
