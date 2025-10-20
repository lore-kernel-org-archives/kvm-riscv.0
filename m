Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA227CCD193
	for <kvm-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 04:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gx+SS4/B6MPG9O4W6t/RjKZmNCvbqmuetqn6VnUyQAY=; b=o1FBwqutn0+abG
	WYLEdriATyeOtIVAE0O1MFV9gGV1h/7STgAcPjfVtzfF1CYwr/oEbbk3Cqm8nSuNqoVpE8gLpP3+f
	qmaCw+D7/59d+wUbxsXcIz1ukfbp5aAA+iWAu+wC3TQERqs7rq/0Z/m6ssmGafq8k0aVL9AnHgDpn
	WidQ51ndr7qDH/zPAlJTBZkECSioEiUpnR16y6zoTbx+8XtYtWxwsoWyW4pvPTAJIS2ddgOXQx8Ts
	8cFSZPtu4X6A466dDKsgc7/13iXaj0GVZpjCWSRG0pKZmGLwpaj2wZTaqhfE/sdoD4h6roBg1A9vF
	av936nZwTodSNlm7TA7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhSx-0000000BqtW-2HWQ;
	Mon, 20 Oct 2025 04:25:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhSw-0000000BqsV-0eZs
	for kvm-riscv@bombadil.infradead.org;
	Mon, 20 Oct 2025 04:25:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=nvb+N79+1rz+7OJYvNB/1WfSxRwqST+oSw7w/swSoZg=; b=MEQGK47HeZS0p5tmQlVkVJ97LZ
	sCVzlpciXvBwB/Ro7joPKKlfskqsNi8S/FuOts4rNdfT2h+g7muk0jyVPTpL0hpa9hNCxxHheMy9p
	+TRzblftUTVxpSamCtikJXbGJ9ZpIh/tG9VP2DLnB9tll8V9l5qx0+AcUBjropt0gSk9oj09B4vk7
	IokrrCDbmp9s9zz3nN9JoQ5YNSfVB0A02ybg5XkjG2iyDrSM2/QLYo2UK56jhMSuBl4yquIC9telH
	GuGBUsBgUAkFu5srWy/RYF8eeFM61pUqDXxvnl9PmoNG0XiAFgGyhYelg0YrhIQzFBZtU5LaJdwg5
	clYvobYw==;
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhSs-00000009VBN-3EI0
	for kvm-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 04:25:48 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-793021f348fso3485453b3a.1
        for <kvm-riscv@lists.infradead.org>; Sun, 19 Oct 2025 21:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1760934345; x=1761539145; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvb+N79+1rz+7OJYvNB/1WfSxRwqST+oSw7w/swSoZg=;
        b=ai8bWfWrMUG8zhvfpo8AcZ+VhwcvHIt8pa6j2rgK8yk0qK67h+4UyjYXv7osM2XXT6
         LWNaNnk0Jh/It5BPCIu5YV3cLqnMznrcKp50ZKIYBaJ+B00dVYtMOkp/A+h0fP59rDZt
         4JVxasPqO/wIHlPlYwW/CkIYuLmpYD6KL4Z9SvOsd6sBsLV3+PBc8H8g8wqWmCtXj57J
         E5ArviX0GXbkJDAFgccOwkyCP+Q8yLLjKjaHMWXVVWiTa5sDFgNH7P9u7/aa3iSrhpak
         vuUM7U3xXE5b+u7xoc2MmLHo/yuqpmTvNTIqdhpwlmyuHMP8Gmg/+1ZHIZSw4UHqmWeO
         5Tsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760934345; x=1761539145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvb+N79+1rz+7OJYvNB/1WfSxRwqST+oSw7w/swSoZg=;
        b=XMQUuPzJ10MRD80fMEzRTq90tywG2/lqbOTeJLG8ug0a64np8JFSCR2t+oW6S6dm5D
         lqYnrLNt1wmIp5bezAnwPD4FNdqS8e6XIj6yz2ZBc82HmqmeJkzKf7q6qD8z405saAE6
         PlKYYGPSAyU4e/vuUfa3cqGsGtNK4WHEKgkNXmW4ddVXpr3jdcCmh7UzJS18oPIcsV9S
         9wagD5AZiU5S+nDKDWudTx2uPW0DvRtuXDJZy5u0ii9xIkz/RbKA7j0Z0xF6p6/8fmho
         znpUFaVkGipyeeST5y6px+Yp8NdrvuhmLUP4unYP/7brrtIwu14xtN6ahBb/waySvdZr
         ZfQg==
X-Forwarded-Encrypted: i=1; AJvYcCWugEsBO15oHAcCwhrnnpnrgHTaoKYfIkEPoTzT4xd88aKgSLwniqpl1fYHyhyb9CDADtbUV8Fy2eg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4wwjzMnAlMfn5dDw3errIoqMHwLuGKAAGSzBbYrXx6KjV5UdV
	BDShAzXeeDBenr3SYp4BOIVwl+uWfhs/US/hyc7IvmVQXeqyDbC0DDIWCnN6UukBjDU=
X-Gm-Gg: ASbGnctQxXngOI+9z3TIv1i60gEX7J8x4wivo4BPY40uUd+w5tYi5otp8NITdBxf6c7
	SvC3gJch7Asa2fsjievkzU+zD07rk1jlCDdnr53SrGT0KgpquqE03BO7QOeSV66gVQIYt1YBGqK
	Q3KeYpDGd3ySUK2q09J7PXSn3AQMXOviZWQavrKU7/pHVr105WSAH/UDQyB+mYKfazGE7VMxnAG
	/yJRrFi3b3MxRxHEEmaATAF/3H5/sgpZmddf8Xpo3c25MsKE8JMCfFBuH1a/SgJHxe8NYRvqQ3Q
	GtnpnOuo7vjctSGXvE9a7BqgDNOujR9TErMQBe6FTF6c6XqDBM4AwYJ8wSOLQs0nuHGYHTxedbK
	JAauC5I+elp+OJi6iIoUJbyLhQ7XLCkq1RAY19tfrJHDFL8KGPEWw6bneUO7DaqFF56UhmRf/4V
	eXetd6AICYrcOyko1LG9Y5N0uWCbSOJGsXulLUPjd6UhOgdzI2J1NwvsMy2DaJDK5OwiF0DvPj+
	w==
X-Google-Smtp-Source: AGHT+IH0j6CDe697/Hu2JYLa69TXmwS2tLcGClfdWod/OVynSzlnBv0UTOF6Th9AWlAgJGMUHpIxww==
X-Received: by 2002:a17:903:3c24:b0:269:8f2d:5221 with SMTP id d9443c01a7336-290c9c89cd4mr136224525ad.9.1760934344799;
        Sun, 19 Oct 2025 21:25:44 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ec20a4sm68319325ad.7.2025.10.19.21.25.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Oct 2025 21:25:44 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	will@kernel.org,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	mark.rutland@arm.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pbonzini@redhat.com,
	shuah@kernel.org,
	parri.andrea@gmail.com,
	ajones@ventanamicro.com,
	brs@rivosinc.com,
	guoren@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	lukas.bulwahn@gmail.com,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v4 09/10] RISC-V: KVM: Allow Zalasr extensions for Guest/VM
Date: Mon, 20 Oct 2025 12:24:56 +0800
Message-ID: <20251020042457.30915-5-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251020042457.30915-1-luxu.kernel@bytedance.com>
References: <20251020042457.30915-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_052546_951339_55E059B0 
X-CRM114-Status: UNSURE (   7.98  )
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

Extend the KVM ISA extension ONE_REG interface to allow KVM user space
to detect and enable Zalasr extensions for Guest/VM.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu_onereg.c      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index ef27d4289da11..4fbc32ef888fa 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -185,6 +185,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZICCRSE,
 	KVM_RISCV_ISA_EXT_ZAAMO,
 	KVM_RISCV_ISA_EXT_ZALRSC,
+	KVM_RISCV_ISA_EXT_ZALASR,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index cce6a38ea54f2..6ae5f9859f25b 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -50,6 +50,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZAAMO),
 	KVM_ISA_EXT_ARR(ZABHA),
 	KVM_ISA_EXT_ARR(ZACAS),
+	KVM_ISA_EXT_ARR(ZALASR),
 	KVM_ISA_EXT_ARR(ZALRSC),
 	KVM_ISA_EXT_ARR(ZAWRS),
 	KVM_ISA_EXT_ARR(ZBA),
@@ -184,6 +185,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_ZAAMO:
 	case KVM_RISCV_ISA_EXT_ZABHA:
 	case KVM_RISCV_ISA_EXT_ZACAS:
+	case KVM_RISCV_ISA_EXT_ZALASR:
 	case KVM_RISCV_ISA_EXT_ZALRSC:
 	case KVM_RISCV_ISA_EXT_ZAWRS:
 	case KVM_RISCV_ISA_EXT_ZBA:
-- 
2.20.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
