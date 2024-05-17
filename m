From: Conor Dooley <conor@kernel.org>
Date: Fri, 17 May 2024 17:44:44 +0100
Subject: [PATCH v5 07/16] riscv: add ISA extensions validation callback
In-Reply-To: <20240517145302.971019-8-cleger@rivosinc.com>
References: <20240517145302.971019-1-cleger@rivosinc.com>
 <20240517145302.971019-8-cleger@rivosinc.com>
Message-ID: <20240517-scrunch-palace-2f83aa8cc3ce@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 17, 2024 at 04:52:47PM +0200, Cl?ment L?ger wrote:
> Since a few extensions (Zicbom/Zicboz) already needs validation and
> future ones will need it as well (Zc*) add a validate() callback to
> struct riscv_isa_ext_data. This require to rework the way extensions are
> parsed and split it in two phases. First phase is isa string or isa
> extension list parsing and consists in enabling all the extensions in a
> temporary bitmask (source isa) without any validation. The second step
> "resolves" the final isa bitmap, handling potential missing dependencies.
> The mechanism is quite simple and simply validate each extension
> described in the source bitmap before enabling it in the resolved isa
> bitmap. validate() callbacks can return either 0 for success,
> -EPROBEDEFER if extension needs to be validated again at next loop. A
> previous ISA bitmap is kept to avoid looping multiple times if an
> extension dependencies are never satisfied until we reach a stable
> state. In order to avoid any potential infinite looping, allow looping
> a maximum of the number of extension we handle. Zicboz and Zicbom
> extensions are modified to use this validation mechanism.

I wish we weren't doin' it at all, but since we have to, I think what
you've got here is good.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Do you want me to send some patches for the F/V stuff we discussed
previously?

Cheers,
Conor.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240517/d0081efc/attachment-0001.sig>
