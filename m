From: Conor Dooley <conor@kernel.org>
Date: Sun, 12 Feb 2023 17:06:19 -0000
Subject: [PATCH v5 00/13] riscv: improve boot time isa extensions handling
In-Reply-To: <Y+kU9nDBTttZRLLq@spud>
References: <20230128172856.3814-1-jszhang@kernel.org>
 <20230212154333.GA3760469@roeck-us.net>
 <Y+kM//nuDv29Z9qJ@spud>
 <Y+kU9nDBTttZRLLq@spud>
Message-ID: <Y+kcgcncQO/2DNLo@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Feb 12, 2023 at 04:33:58PM +0000, Conor Dooley wrote:
> On Sun, Feb 12, 2023 at 03:59:59PM +0000, Conor Dooley wrote:

So as not to lead anyone up the garden path, let me correct myself:

> Hmm, so this appears to be us attempting to patch in alternatives where
> none actually exists - seemingly F & D.

And of course that's not true, riscv_has_extension_likely() now uses
alternatives as of:
bdda5d554e43 ("riscv: introduce riscv_has_extension_[un]likely()")

From a quick look, it just happens that the only users are F & D.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230212/6cae402f/attachment-0001.sig>
