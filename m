Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9169CCAC592
	for <kvm-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 07:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fdbyh5zCAE/JZrNcgDdpNbI9GUE59ypZHciwtoMuf0I=; b=esEQWArGJaskba
	JAlgHaNhyb73HWjlth56O/1rFrgJwE+030D4sXDheBY7qqfL4uGtwcr5Zcv6XI/MfzbHw/GE8Gu/H
	wSg2hh8IxLSAe1uKO6sQX2WJYMBTt3SD8m2NVCagEuGwYrB9TqAnd3/X9F+O9uiICZZHujaULnkK/
	d4J2qeUylBmGnKoLX+FmXY2HFJfgRSxjIWCE6lf5ATlV1g3BrMow+FvJL3DTYuFszlwS92EfhTEF8
	ABdIVnoKWxVXpHSIaF/T50ofjUV19NAMxsNANCkiEewtaVyQRPI1MB9Yx3stpLlRumTdXDy31JDie
	ajuhKEk9BgnV2ig11W+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVhv-0000000265j-1QAz;
	Fri, 19 Sep 2025 07:39:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVhu-0000000264n-0PN4
	for kvm-riscv@bombadil.infradead.org;
	Fri, 19 Sep 2025 07:39:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=K/wZtJxRjsPgsFT1TZQP06vJqUDEl57iCFv88CuZkP4=; b=quwolJmK6SU8xgY0u1jd+Hzphs
	EQRixHKsz8IzEOXVdKrzck5yKMLHZHV8GrTsPc02+RL1bcLfXGSIzEVG9hwWehkIGByY6ugQquePp
	f8B6aCYzPpGu1d4g1dQEew/9TYh1TbP6A1q7QYBQWWKzLkvaBFIKGk4REsmQlyu6AihvwGHODPL9R
	t+BNxmFu2M6SE8kVPetd2iPw6IcSLcL5po7D4xxd1yx9iwxRWwyfe4/Ob3YGACi8NAliqJFsjxD54
	kh1Ve7GPgSOWUvr882SVxnkt5HTUHZDae8TYJXe3J1I1Y1HzEBaqhu3GK0iocV3UAk6qovt9JbkPV
	V0UoQztw==;
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVhm-00000007lj2-2OCf
	for kvm-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 07:38:58 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7726c7ff7e5so1649554b3a.3
        for <kvm-riscv@lists.infradead.org>; Fri, 19 Sep 2025 00:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758267532; x=1758872332; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/wZtJxRjsPgsFT1TZQP06vJqUDEl57iCFv88CuZkP4=;
        b=inPxst5OjnMJGf8ZNdZJekXKje5NcrL+s4sbbcNDVmLIHbMIS/xt69qBTYase3XynM
         0LO1HAt9vxeKuLtVYONyn11j9yb8zAUR1V2XrxuCwP73P4rTPSpph01wNxqvNvUUN8Eb
         XL6tTtwLeoAt/mCpYM84nk7e7Gd+HAd8b6yyRbZ9iKzT4wH/GHX/qKBikIYZ39r4iTtl
         mKLXdFXMmIdi5vPNRadMFekFj/JdhCsT5aKMeAgr8g2FEE3CXEZRsMzh+Yb0lTw+pyrS
         9sw9zn+OG0dhssCvMrU8eTrT9hQ695HFA4d3QB546BMtayRQVZIHOj0hqwanaZbmdvDb
         wuAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758267532; x=1758872332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/wZtJxRjsPgsFT1TZQP06vJqUDEl57iCFv88CuZkP4=;
        b=wTYlMPzb/UELOosMHZXxhh5QIDry0BmMLPAVtfwWnv68ueotRx5nR/7jT3QDRfmbSi
         TVv5Al6C/Deh6oxzu1P2dy5+l65owEE6vJI5GkI2UepPcYTfUZsSAddV8YRBdL0RP0NM
         GQOt2SyR6ol9wA98UxHe13z+J3j36D7Ikok4A97kTZl/0JM7dvRv78XYYoCbujvMUses
         4ZTVnWROVHiXia+APR82cuGgYv2EvHUR09z1limF2wizRIjPuZZOrjoanGDe3sPyGf2J
         vsFaEEhex40VoyLLotLSztPgsSjQGZAk7vEgEIAe/LOVQjACFmC+fwq21/o77X12guU3
         lQMw==
X-Forwarded-Encrypted: i=1; AJvYcCWmsH1SpbVMSJ2lsvL28oB/4BlyFF+hA+pJFlmNgLWMYOaDkhEH8yh/e32LwgBDqnpNKtYtnjGzOBQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzUPrI2Qg07P2+DtQYgCK/GPo+pjVV2btnM9zslXYcAZrAQjJeO
	nZUbL7o6umCzU7uVC0NLgmvBPE8lObRUBY/p1gknlTf5XDjsDRDcyDTdWtJuB5fDBJN1g+bKTuo
	hc/LotlRZVw==
X-Gm-Gg: ASbGnctwWdsviz1zYDtybnWjIY0O9gjUIQQfE0TbnJ8L6QEbpYJADvrhyzbYTDOKBv/
	qdXvqP/t6upqbtSl3l1ERmS/1AjZj/94IZdg3JBA/bbaomoVmkWz9wxSAFcyCDGGazGV815vRvO
	sA02MdE+wIHuOfIFOKwtaBVkR3j7TeGrqv3JMHajDY0duWfk0mfYyEUMDvi5YBqhNgY4bYULxCO
	ceWphOpnnQo8o6zEnBq6uNYRrjhKgVTCCCfoXDxufu1VGBA5KYmfXZdrjtFhKbHC+31mDEZgWmI
	nB03xNCVHV5WU9nRvf6UTXsPq6+RN/VIojzpL9YxLl52cASsxRX8S59/0Kwo1jz/4bubZDvYffv
	d9KrlKeG8HKfqWFHrT3icLzKQDdoLXnMWCHFLWeHcS4nhnuGwIJW257gNk4HlD4AQbEPGq+0jqL
	vLB0b8gnvlIZmAHRFfZGSDO3QmkX9hIxI8oEUKpfodIw==
X-Google-Smtp-Source: AGHT+IH+4QZdIMI6dt1vIbAhIv1otTpdn3Cuf58RfGKyqc29IOHSadIrxg84hnYxuSAKEAjnTACHLA==
X-Received: by 2002:a05:6a20:244e:b0:24d:d206:6992 with SMTP id adf61e73a8af0-29260d81077mr3369360637.22.1758267532201;
        Fri, 19 Sep 2025 00:38:52 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b550fd7ebc7sm2679096a12.19.2025.09.19.00.38.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Sep 2025 00:38:52 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: corbet@lwn.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	will@kernel.org,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	mark.rutland@arm.com,
	parri.andrea@gmail.com,
	ajones@ventanamicro.com,
	brs@rivosinc.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pbonzini@redhat.com,
	shuah@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v3 8/8] KVM: riscv: selftests: Add Zalasr extensions to get-reg-list test
Date: Fri, 19 Sep 2025 15:37:14 +0800
Message-ID: <20250919073714.83063-9-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250919073714.83063-1-luxu.kernel@bytedance.com>
References: <20250919073714.83063-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_083856_181025_4EA66119 
X-CRM114-Status: UNSURE (   8.80  )
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

The KVM RISC-V allows Zalasr extensions for Guest/VM so add these
extensions to get-reg-list test.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index a0b7dabb50406..3020e37f621ba 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -65,6 +65,7 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZAAMO:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZABHA:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZACAS:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZALASR:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZALRSC:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZAWRS:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZBA:
@@ -517,6 +518,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
 		KVM_ISA_EXT_ARR(ZAAMO),
 		KVM_ISA_EXT_ARR(ZABHA),
 		KVM_ISA_EXT_ARR(ZACAS),
+		KVM_ISA_EXT_ARR(ZALASR),
 		KVM_ISA_EXT_ARR(ZALRSC),
 		KVM_ISA_EXT_ARR(ZAWRS),
 		KVM_ISA_EXT_ARR(ZBA),
@@ -1112,6 +1114,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(svvptc, SVVPTC);
 KVM_ISA_EXT_SIMPLE_CONFIG(zaamo, ZAAMO);
 KVM_ISA_EXT_SIMPLE_CONFIG(zabha, ZABHA);
 KVM_ISA_EXT_SIMPLE_CONFIG(zacas, ZACAS);
+KVM_ISA_EXT_SIMPLE_CONFIG(zalasr, ZALASR);
 KVM_ISA_EXT_SIMPLE_CONFIG(zalrsc, ZALRSC);
 KVM_ISA_EXT_SIMPLE_CONFIG(zawrs, ZAWRS);
 KVM_ISA_EXT_SIMPLE_CONFIG(zba, ZBA);
@@ -1187,6 +1190,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_zabha,
 	&config_zacas,
 	&config_zalrsc,
+	&config_zalasr,
 	&config_zawrs,
 	&config_zba,
 	&config_zbb,
-- 
2.20.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
