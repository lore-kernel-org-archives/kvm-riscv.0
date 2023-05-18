From: Conor Dooley <conor@kernel.org>
Date: Thu, 18 May 2023 18:28:47 +0100
Subject: [PATCH -next v20 03/26] riscv: hwprobe: Add support for probing
 V in RISCV_HWPROBE_KEY_IMA_EXT_0
In-Reply-To: <20230518161949.11203-4-andy.chiu@sifive.com>
References: <20230518161949.11203-1-andy.chiu@sifive.com>
 <20230518161949.11203-4-andy.chiu@sifive.com>
Message-ID: <20230518-decade-slighting-02219199662e@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 18, 2023 at 04:19:26PM +0000, Andy Chiu wrote:
> Probing kernel support for Vector extension is available now. This only
> add detection for V only. Extenions like Zvfh, Zk are not in this scope.
> 
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>

Looks grand now!
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230518/b9f0e1cd/attachment.sig>
