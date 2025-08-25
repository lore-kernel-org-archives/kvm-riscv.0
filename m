Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AAAECA0FE7
	for <kvm-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 15:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uMS5ViGEiFfXmvpa0ONCC1ZpGliDc2I+Nkhm07hoHoU=; b=G4RvjZbbaSKjub
	cl9fe3+dlvu5plcDJK1xrxnqHeRjTOKPE/EPjbPG0cnwqoH5y/dPsjnlf164rqo1pDXBkwyBdyyZH
	UKr4Ht35KCajwUzyifnPkbuOEgXN0MWwfha6ZS1Qgx6hCAXyaVZizm/Tw2cerEkQrNuLSoGd3nhVd
	s6QQNT4dcxTfp8Vo2q+BLJClm1rlNPmasr9rCjQ0RMwXrJFctz8NHlEs+3EdEX9OMxaVPD2b3GN7u
	cG5Afjg3nwL/pv3TX7+Ccgg2L3PU0trICLzGFmiDqaTuYb8ob4yKPHpdZKQ8mKRnKAS/EuaxUGTiS
	CNdQz2hXqK1krawuW30w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZXZ-00000008Zl3-3XWm;
	Mon, 25 Aug 2025 15:55:25 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYf6-00000008LHL-3Kv7;
	Mon, 25 Aug 2025 14:59:11 +0000
Received: from ROG (unknown [118.251.178.216])
	by APP-05 (Coremail) with SMTP id zQCowABX6lopeqxooi0eDw--.61332S2;
	Mon, 25 Aug 2025 22:58:51 +0800 (CST)
From: <pincheng.plct@isrc.iscas.ac.cn>
To: <inochiama@gmail.com>
Cc: <ajones@ventanamicro.com>,
	<alex@ghiti.fr>,
	<anup@brainfault.org>,
	<aou@eecs.berkeley.edu>,
	<charlie@rivosinc.com>,
	<cleger@rivosinc.com>,
	<conor+dt@kernel.org>,
	<cuiyunhui@bytedance.com>,
	<cyan.yang@sifive.com>,
	<devicetree@vger.kernel.org>,
	<jesse@rivosinc.com>,
	<krzk+dt@kernel.org>,
	<kvm-riscv@lists.infradead.org>,
	<kvm@vger.kernel.org>,
	<linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>,
	<mikisabate@gmail.com>,
	<namcao@linutronix.de>,
	<palmer@dabbelt.com>,
	<parri.andrea@gmail.com>,
	<paul.walmsley@sifive.com>,
	<pbonzini@redhat.com>,
	<pincheng.plct@isrc.iscas.ac.cn>,
	<robh@kernel.org>,
	<samuel.holland@sifive.com>,
	<shuah@kernel.org>,
	<thomas.weissschuh@linutronix.de>,
	<yikming2222@gmail.com>,
	<yongxuan.wang@sifive.com>
Subject: Re: [PATCH v1 RESEND 1/5] dt-bidings: riscv: add Zilsd and Zclsd extension descriptions
Date: Mon, 25 Aug 2025 22:58:49 +0800
Message-ID: <001e01dc15d0$c4842e10$4d8c8a30$@isrc.iscas.ac.cn>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdwV0HURyytbkCJFT0CWNFw9272t/g==
Content-Language: zh-cn
X-CM-TRANSID: zQCowABX6lopeqxooi0eDw--.61332S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAr4Uur48KryUtFWxWFW8Crg_yoW5Kry8pa
	97GF4UGF98XryfW3s7Kw48uay5Ga1kGr1fCFsrt34xKFW5Ar10qFW2y3WYqw18Jr4IkF4j
	vr42gr1vq3sxArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9E14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWUuVWrJwAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwAKzVCY07xG64k0F24lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26rWY6r4UJwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7sREb4S5UUUUU==
X-Originating-IP: [118.251.178.216]
X-CM-SenderInfo: pslquxhhqjh1xofwqxxvufhxpvfd2hldfou0/
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_075909_231136_7A303DF3 
X-CRM114-Status: GOOD (  20.57  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

> -----Original Message-----
> From: Inochi Amaoto <inochiama@gmail.com>
> Sent: Saturday, August 23, 2025 6:35 AM
> To: Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>;
> paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu;
> alex@ghiti.fr; robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> anup@brainfault.org; pbonzini@redhat.com; shuah@kernel.org;
> cyan.yang@sifive.com; cleger@rivosinc.com; charlie@rivosinc.com;
> cuiyunhui@bytedance.com; samuel.holland@sifive.com;
> namcao@linutronix.de; jesse@rivosinc.com; inochiama@gmail.com;
> yongxuan.wang@sifive.com; ajones@ventanamicro.com;
> parri.andrea@gmail.com; mikisabate@gmail.com; yikming2222@gmail.com;
> thomas.weissschuh@linutronix.de
> Cc: linux-riscv@lists.infradead.org; linux-kernel@vger.kernel.org;
> linux-doc@vger.kernel.org; devicetree@vger.kernel.org; kvm@vger.kernel.org;
> kvm-riscv@lists.infradead.org; linux-kselftest@vger.kernel.org
> Subject: Re: [PATCH v1 RESEND 1/5] dt-bidings: riscv: add Zilsd and Zclsd
> extension descriptions
> 
> On Thu, Aug 21, 2025 at 10:01:27PM +0800, Pincheng Wang wrote:
> > Add descriptions for the Zilsd (Load/Store pair instructions) and
> > Zclsd (Compressed Load/Store pair instructions) ISA extensions which
> > were ratified in commit f88abf1 ("Integrating load/store pair for RV32
> > with the main manual") of the riscv-isa-manual.
> >
> > Signed-off-by: Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>
> > ---
> >  .../devicetree/bindings/riscv/extensions.yaml | 39
> > +++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > index ede6a58ccf53..d72ffe8f6fa7 100644
> > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > @@ -366,6 +366,20 @@ properties:
> >              guarantee on LR/SC sequences, as ratified in commit
> b1d806605f87
> >              ("Updated to ratified state.") of the riscv profiles
> specification.
> >
> > +        - const: zilsd
> > +          description:
> > +            The standard Zilsd extension which provides support for
> aligned
> > +            register-pair load and store operations in 32-bit instruction
> > +            encodings, as ratified in commit f88abf1 ("Integrating
> > +            load/store pair for RV32 with the main manual") of
> riscv-isa-manual.
> > +
> > +        - const: zclsd
> > +          description:
> > +            The Zclsd extension implements the compressed (16-bit)
> version of the
> > +            Load/Store Pair for RV32. As with Zilsd, this extension was
> ratified
> > +            in commit f88abf1 ("Integrating load/store pair for RV32 with
> the
> > +            main manual") of riscv-isa-manual.
> > +
> >          - const: zk
> >            description:
> >              The standard Zk Standard Scalar cryptography extension as
> > ratified @@ -847,6 +861,16 @@ properties:
> >              anyOf:
> >                - const: v
> >                - const: zve32x
> 
> > +      # Zclsd depends on Zilsd and Zca
> > +      - if:
> > +          contains:
> > +            anyOf:
> > +              - const: zclsd
> > +        then:
> > +          contains:
> > +            anyOf:
> > +              - const: zilsd
> > +              - const: zca
> >
> 
> Should be allOf? I see the comment says "Zclsd" requires both "Zilsd"
> and "Zca".
> 
> Regards,
> Inochi

You're absolutely right, thank you for catching this. Since Zclsd depends on both Zilsd and Zca, the condition should use allOf to correctly enforce the conjunction. I'll fix this in next revision.

Best regards,
Pincheng Wang


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
