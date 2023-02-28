From: Conor Dooley <conor@kernel.org>
Date: Tue, 28 Feb 2023 22:17:50 -0000
Subject: [PATCH -next v14 04/19] riscv: Clear vector regfile on bootup
In-Reply-To: <20230224170118.16766-5-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-5-andy.chiu@sifive.com>
Message-ID: <Y/59hMj+0D0QBrG+@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 24, 2023 at 05:01:03PM +0000, Andy Chiu wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
> 
> clear vector registers on boot if kernel supports V.
> 
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> [vineetg: broke this out to a seperate patch]
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230228/66ee6304/attachment-0001.sig>
