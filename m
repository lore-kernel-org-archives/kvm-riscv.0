Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE800CA0FE7
	for <kvm-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 17:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0aEXI5uNcJfckaXFx7b81QaL0Wn+pj20L4Omx2Lvj00=; b=Q7wXpPdRTgHUOJ
	ewdmcTWibrakOqW9JUL4tlcvP8KSLmfAYnG+XepsEzYQq/mn1r3B9Juz8NL8Dgvq67PBlbUhHsXHi
	92jHlvsU1siir9YbTyYKkrFocsjGCLfxg4MekBcWCdn4MRG8KN2L7mHgKgbocWlvpbLeJLh0+RVpg
	yO8injIr4dZUEcmLdEsPdIiHxkKZNssIdoCuEXd+WjeLEOyEO6aug+VQ4x4NRfU0zKb3W1dpJcY5X
	Lk0SkZ0CTEJFcAfUEaVSi34XsIvVdrNUBQh/Of3ndQVqTy6SsF8WqspfG10BO2CdIbVcHzLWULPyG
	Cq1TL6RtxeW0QGjBu4yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqafu-00000008mwq-1qi8;
	Mon, 25 Aug 2025 17:08:06 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZ5V-00000008VOp-48fp;
	Mon, 25 Aug 2025 15:26:27 +0000
Received: from [192.168.110.25] (unknown [118.251.178.216])
	by APP-05 (Coremail) with SMTP id zQCowACXLF2WgKxok2QfDw--.14476S2;
	Mon, 25 Aug 2025 23:26:15 +0800 (CST)
Message-ID: <a2cc4cbe-82ca-4a89-b623-73721a1f3baf@isrc.iscas.ac.cn>
Date: Mon, 25 Aug 2025 23:26:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 RESEND 1/5] dt-bidings: riscv: add Zilsd and Zclsd
 extension descriptions
To: Conor Dooley <conor@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 anup@brainfault.org, pbonzini@redhat.com, shuah@kernel.org,
 cyan.yang@sifive.com, cleger@rivosinc.com, charlie@rivosinc.com,
 cuiyunhui@bytedance.com, samuel.holland@sifive.com, namcao@linutronix.de,
 jesse@rivosinc.com, inochiama@gmail.com, yongxuan.wang@sifive.com,
 ajones@ventanamicro.com, parri.andrea@gmail.com, mikisabate@gmail.com,
 yikming2222@gmail.com, thomas.weissschuh@linutronix.de,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <20250821140131.225756-1-pincheng.plct@isrc.iscas.ac.cn>
 <20250821140131.225756-2-pincheng.plct@isrc.iscas.ac.cn>
 <20250822-purge-doubling-f38988284db1@spud>
From: Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>
In-Reply-To: <20250822-purge-doubling-f38988284db1@spud>
X-CM-TRANSID: zQCowACXLF2WgKxok2QfDw--.14476S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCr47Ww18Kw47Xr4xKrW3Jrb_yoW5Kr43pF
	Z3GF4kKa90qw13u3s2y3W0vw45AF4kKw13AFnrt34fKa98Zr10gF4ak3Z0qF1rCF48CF4j
	vw4Ygr15ZrsrAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26rWY6r4UJwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IUYsyCtUUUUU==
X-Originating-IP: [118.251.178.216]
X-CM-SenderInfo: pslquxhhqjh1xofwqxxvufhxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_082626_392173_4EDEFEC5 
X-CRM114-Status: GOOD (  17.28  )
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

On 2025/8/23 0:33, Conor Dooley wrote:
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
>> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
>> index ede6a58ccf53..d72ffe8f6fa7 100644
>> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
>> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
>> @@ -366,6 +366,20 @@ properties:
>>               guarantee on LR/SC sequences, as ratified in commit b1d806605f87
>>               ("Updated to ratified state.") of the riscv profiles specification.
>>   
>> +        - const: zilsd
>> +          description:
>> +            The standard Zilsd extension which provides support for aligned
>> +            register-pair load and store operations in 32-bit instruction
>> +            encodings, as ratified in commit f88abf1 ("Integrating
>> +            load/store pair for RV32 with the main manual") of riscv-isa-manual.
>> +
>> +        - const: zclsd
>> +          description:
>> +            The Zclsd extension implements the compressed (16-bit) version of the
>> +            Load/Store Pair for RV32. As with Zilsd, this extension was ratified
>> +            in commit f88abf1 ("Integrating load/store pair for RV32 with the
>> +            main manual") of riscv-isa-manual.
>> +
>>           - const: zk
>>             description:
>>               The standard Zk Standard Scalar cryptography extension as ratified
>> @@ -847,6 +861,16 @@ properties:
>>               anyOf:
>>                 - const: v
>>                 - const: zve32x
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
>>   allOf:
>>     # Zcf extension does not exist on rv64
>> @@ -864,6 +888,21 @@ allOf:
>>             not:
>>               contains:
>>                 const: zcf
>> +  # Zilsd extension does not exist on rv64
>> +  - if:
>> +      properties:
> 
>> +        riscv,isa-extensions:
>> +          contains:
>> +            const: zilsd
> 
> This syntax is odd, it shouldn't be required to have zilsd in here and
> in the then. Did you copy this from Zcf or come up with it yourself
> because it didn't work otherwise?
> 

Yes, I did model this after the existing Zcf constraint in the same 
file. The structure is nearly identical: cheking for presence of the 
extension and rv64i, then forbidding it in the "then" branch.

I've tested confirmed that removing the "contains: const: zilsd" from 
the "if" condition still correctly enforces that zilsd must not appear 
when rv64i is present. The "then" clause with "not: contains" is sufficient.

Given that the validation behavior is equivalent, but the logic is 
cleaner and less redundant without the extra "contains", would you 
recommend updating it to the simpler form:

     - if:
         properties:
           riscv,isa-base:
             contains:
               const: rv64i
       then:
         properties:
           riscv,isa-extensions:
             not:
               contains:
                 const: zilsd

If so, I'll update it in the next revision.

Thanks for the review!

Best regards,
Pincheng Wang

>> +        riscv,isa-base:
>> +          contains:
>> +            const: rv64i
>> +    then:
>> +      properties:
>> +        riscv,isa-extensions:
>> +          not:
>> +            contains:
>> +              const: zilsd
>>   
>>   additionalProperties: true
>>   ...
>> -- 
>> 2.39.5
>>


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
