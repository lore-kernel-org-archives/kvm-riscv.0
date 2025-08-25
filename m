Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821A3CA0FEE
	for <kvm-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 17:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MNMLIbNAZ/9D9I3d7bUFCnMs43CaFNc7K2OFE/lNiTk=; b=vcJ7R1qRAhenja
	whK8NWtQ9kgeBPo3EuHnhWEgGEFlyU8tOeuU1Ia5kwAJhFCE0GYCp0JdY8pMrPGmEICvp83wt99cE
	dsS2/OotkcQk4enB6XsiJ0Bt9C1B3SUrbARyT9iFAFmeGRWWPYZssbrCIT9opJmHsPQyLussHjpPV
	WsJZMOplTUqvGwqMBPk5F2wkItJv0NNu8JSf5AF6jA3bWYHBvKRypeHZoBb2mifPUavlF4PbOENFQ
	gUNjZt10pPRZJ2RPEpS2ECSV1TY4PSftIU4SM8TTuCGzBiGTKdEIAGvuH+Yu8jcqzD+ifpydFKgUO
	DkqMX1fDMt0xDjgADB2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqaYu-00000008kay-3iAi;
	Mon, 25 Aug 2025 17:00:52 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZvF-00000008dec-0ubD;
	Mon, 25 Aug 2025 16:19:55 +0000
Received: from [192.168.110.25] (unknown [118.251.178.216])
	by APP-05 (Coremail) with SMTP id zQCowADXaVocjaxos6UhDw--.6581S2;
	Tue, 26 Aug 2025 00:19:42 +0800 (CST)
Message-ID: <b812bb46-6a26-456a-8210-d02138fb31a6@isrc.iscas.ac.cn>
Date: Tue, 26 Aug 2025 00:19:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: inochiama@gmail.com
Cc: ajones@ventanamicro.com, alex@ghiti.fr, anup@brainfault.org,
 aou@eecs.berkeley.edu, charlie@rivosinc.com, cleger@rivosinc.com,
 conor+dt@kernel.org, cuiyunhui@bytedance.com, cyan.yang@sifive.com,
 devicetree@vger.kernel.org, jesse@rivosinc.com, krzk+dt@kernel.org,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
 mikisabate@gmail.com, namcao@linutronix.de, palmer@dabbelt.com,
 parri.andrea@gmail.com, paul.walmsley@sifive.com, pbonzini@redhat.com,
 pincheng.plct@isrc.iscas.ac.cn, robh@kernel.org, samuel.holland@sifive.com,
 shuah@kernel.org, thomas.weissschuh@linutronix.de, yikming2222@gmail.com,
 yongxuan.wang@sifive.com
References: <znik7dcyeipf57xerlm5gwjszcaaeujoukr7g4a7wt7lsfu366@skany6k7agt4>
Subject: Re: [PATCH v1 RESEND 1/5] dt-bidings: riscv: add Zilsd and Zclsd
 extension descriptions
From: Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>
In-Reply-To: <znik7dcyeipf57xerlm5gwjszcaaeujoukr7g4a7wt7lsfu366@skany6k7agt4>
X-CM-TRANSID: zQCowADXaVocjaxos6UhDw--.6581S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF4fKrWkurWxZr18AryUtrb_yoW8Kw4Upa
	93CF18KFZ8Xw13u3s7tw18Xw45Jr4kKr15AF47t34xKay5Ar10qFWakw1YvF18GF4xCF4I
	va1Ygw1fZ3ZrAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvE14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWUuVWrJwAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
	c2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
	WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
	67kF1VAFwI0_Wrv_Gr1UMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
	evJa73UjIFyTuYvjTRM6wCDUUUU
X-Originating-IP: [118.251.178.216]
X-CM-SenderInfo: pslquxhhqjh1xofwqxxvufhxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_091953_625661_F88C2649 
X-CRM114-Status: GOOD (  13.52  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On 2025/8/23 6:34, Inochi Amaoto wrote:
 > On Thu, Aug 21, 2025 at 10:01:27PM +0800, Pincheng Wang wrote:
 >> Add descriptions for the Zilsd (Load/Store pair instructions) and
 >> Zclsd (Compressed Load/Store pair instructions) ISA extensions
 >> which were ratified in commit f88abf1 ("Integrating load/store
 >> pair for RV32 with the main manual") of the riscv-isa-manual.
 >>
 >> Signed-off-by: Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>
 >> ---
 >>   .../devicetree/bindings/riscv/extensions.yaml | 39 +++++++++++++++++++
 >>   1 file changed, 39 insertions(+)
 >>
 >> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml 
b/Documentation/devicetree/bindings/riscv/extensions.yaml
 >> index ede6a58ccf53..d72ffe8f6fa7 100644
 >> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
 >> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
 >> @@ -366,6 +366,20 @@ properties:
 >>               guarantee on LR/SC sequences, as ratified in commit 
b1d806605f87
 >>               ("Updated to ratified state.") of the riscv profiles 
specification.
 >>
 >> +        - const: zilsd
 >> +          description:
 >> +            The standard Zilsd extension which provides support for 
aligned
 >> +            register-pair load and store operations in 32-bit 
instruction
 >> +            encodings, as ratified in commit f88abf1 ("Integrating
 >> +            load/store pair for RV32 with the main manual") of 
riscv-isa-manual.
 >> +
 >> +        - const: zclsd
 >> +          description:
 >> +            The Zclsd extension implements the compressed (16-bit) 
version of the
 >> +            Load/Store Pair for RV32. As with Zilsd, this extension 
was ratified
 >> +            in commit f88abf1 ("Integrating load/store pair for 
RV32 with the
 >> +            main manual") of riscv-isa-manual.
 >> +
 >>           - const: zk
 >>             description:
 >>               The standard Zk Standard Scalar cryptography extension 
as ratified
 >> @@ -847,6 +861,16 @@ properties:
 >>               anyOf:
 >>                 - const: v
 >>                 - const: zve32x
 >
 >> +      # Zclsd depends on Zilsd and Zca
 >> +      - if:
 >> +          contains:
 >> +            anyOf:
 >> +              - const: zclsd
 >> +        then:
 >> +          contains:
 >> +            anyOf:
 >> +              - const: zilsd
 >> +              - const: zca
 >>
 >
 > Should be allOf? I see the comment says "Zclsd" requires both "Zilsd"
 > and "Zca".
 >
 > Regards,
 > Inochi

You're absolutely right, thank you for catching this. Since Zclsd 
depends on both Zilsd and Zca, the condition should use allOf to 
correctly enforce the conjunction. I'll fix this in next revision.

Best regards,
Pincheng Wang


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
