Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BB4CA0EFF
	for <kvm-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 19:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=94xbl2dPAos7t1BWlzZ0QYYYD0kYhTrhTaWsQFS+g3M=; b=MyJivjd5St0R59
	+XOaqt8QQvBvWzFGcskAa/uTo/bwEFB7raLxAlEHQnPP5zg4hFdIZlotp+lYe/0CyYfTPPXlF9OHP
	cSYAL27KYPCb/cG5MgPYXejCQVnKp6POl2tTDK/9KLA+jQnaOew7XTm7lAvkdpPDmgpUNHWQIrlZY
	OxgVSDpcusSewIXVTGYf1meVPkLvOJfbXQUNYBfYqG17Yc7mj64salYO7qNZgrLybyiYf2lXc0ZuY
	SrXAFIhtp8T7fWYPxwLI+Zvo6/1+2sYe+BxoMXTLgmCcLZrEOgM5deJ7asmuH4zBxVMSza+WqKs8P
	5o7nMRwGOpaRtaJXPTDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upAiH-00000000FHH-3nTQ;
	Thu, 21 Aug 2025 19:12:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5rY-0000000H9db-2vpI;
	Thu, 21 Aug 2025 14:01:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=TuYLz5cJ1ahDWB/sh+nnpAMVfJ9cAcHDo7a4pdfBqj0=; b=exSg1YO1KMeOXy2OGsoYybvZeN
	gnLK/1oQAsc3JfPI1KH+/pdNkbWCGSet1Ea7GcNdVd60YCg8yHSfrxYYvLkjrL5fn5+6StmrNLXy2
	JlALiDNjYOudBzQkOtUbUouP+5w+bUb5EGyFNlWkQ8RR+WcrzVaunuQ/4j7z4uqXrcAgKpKARlKH3
	BA8lvU6IybYWYhl7YCauZt+k1xEMESbNT7ILFUKdMNg2G9pCxFuawEFM3NgQxO1CiCClmdSYDksO6
	jwvBd3dc50YWVvoOvQ1YwFOe6VLw6JQY/sk0P9ZiyNnafXH+Kwj8olnkOXAtKw+P4j5VHvu7WSPCv
	s5i0pWIQ==;
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5rV-00000000aLW-0c3b;
	Thu, 21 Aug 2025 14:01:55 +0000
Received: from ROG.lan (unknown [118.251.176.166])
	by APP-03 (Coremail) with SMTP id rQCowABn+Xq+JqdoP8MTDg--.22469S3;
	Thu, 21 Aug 2025 22:01:38 +0800 (CST)
From: Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	anup@brainfault.org,
	pbonzini@redhat.com,
	shuah@kernel.org,
	cyan.yang@sifive.com,
	cleger@rivosinc.com,
	charlie@rivosinc.com,
	cuiyunhui@bytedance.com,
	samuel.holland@sifive.com,
	namcao@linutronix.de,
	jesse@rivosinc.com,
	inochiama@gmail.com,
	yongxuan.wang@sifive.com,
	ajones@ventanamicro.com,
	parri.andrea@gmail.com,
	mikisabate@gmail.com,
	yikming2222@gmail.com,
	thomas.weissschuh@linutronix.de
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	pincheng.plct@isrc.iscas.ac.cn
Subject: [PATCH v1 RESEND 1/5] dt-bidings: riscv: add Zilsd and Zclsd extension descriptions
Date: Thu, 21 Aug 2025 22:01:27 +0800
Message-Id: <20250821140131.225756-2-pincheng.plct@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250821140131.225756-1-pincheng.plct@isrc.iscas.ac.cn>
References: <20250821140131.225756-1-pincheng.plct@isrc.iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowABn+Xq+JqdoP8MTDg--.22469S3
X-Coremail-Antispam: 1UD129KBjvJXoW7CF4ftF48uw17Ww1fCr15Jwb_yoW8tF1rpF
	s3GF1kKas0q3W3ur97tw4xuw15ZF1vqw45AFZFy34xKFZ0yry0qrWay3W5Z3WrCF4xAFyU
	ua1jgr17ZrsrAaDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmq14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWUWVWUuwAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
	M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
	v20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
	kIc2xKxwCY1x0262kKe7AKxVWrXVW3AwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_Wrv_Gr1UMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1l
	IxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r
	1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIY
	CTnIWIevJa73UjIFyTuYvjTRuq2MUUUUU
X-Originating-IP: [118.251.176.166]
X-CM-SenderInfo: pslquxhhqjh1xofwqxxvufhxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_150153_734747_08DC4626 
X-CRM114-Status: UNSURE (   8.46  )
X-CRM114-Notice: Please train this message.
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

Add descriptions for the Zilsd (Load/Store pair instructions) and
Zclsd (Compressed Load/Store pair instructions) ISA extensions
which were ratified in commit f88abf1 ("Integrating load/store
pair for RV32 with the main manual") of the riscv-isa-manual.

Signed-off-by: Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>
---
 .../devicetree/bindings/riscv/extensions.yaml | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index ede6a58ccf53..d72ffe8f6fa7 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -366,6 +366,20 @@ properties:
             guarantee on LR/SC sequences, as ratified in commit b1d806605f87
             ("Updated to ratified state.") of the riscv profiles specification.
 
+        - const: zilsd
+          description:
+            The standard Zilsd extension which provides support for aligned
+            register-pair load and store operations in 32-bit instruction
+            encodings, as ratified in commit f88abf1 ("Integrating
+            load/store pair for RV32 with the main manual") of riscv-isa-manual.
+
+        - const: zclsd
+          description:
+            The Zclsd extension implements the compressed (16-bit) version of the
+            Load/Store Pair for RV32. As with Zilsd, this extension was ratified
+            in commit f88abf1 ("Integrating load/store pair for RV32 with the
+            main manual") of riscv-isa-manual.
+
         - const: zk
           description:
             The standard Zk Standard Scalar cryptography extension as ratified
@@ -847,6 +861,16 @@ properties:
             anyOf:
               - const: v
               - const: zve32x
+      # Zclsd depends on Zilsd and Zca
+      - if:
+          contains:
+            anyOf:
+              - const: zclsd
+        then:
+          contains:
+            anyOf:
+              - const: zilsd
+              - const: zca
 
 allOf:
   # Zcf extension does not exist on rv64
@@ -864,6 +888,21 @@ allOf:
           not:
             contains:
               const: zcf
+  # Zilsd extension does not exist on rv64
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zilsd
+        riscv,isa-base:
+          contains:
+            const: rv64i
+    then:
+      properties:
+        riscv,isa-extensions:
+          not:
+            contains:
+              const: zilsd
 
 additionalProperties: true
 ...
-- 
2.39.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
