Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A926CD8C8C
	for <kvm-riscv@archiver.kernel.org>; Sun,  7 Jun 2026 08:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ldWs9Q1y3Np0fzZfntvoZb9m1hAdrmfs9WSuR0I9Fuw=; b=aRYfs106Tt93jF
	1EZz1X95JmdgeXRTDGphxiMzjI+hvCoyMMV6fHbyloG+puz1/Rw/MTeRQaSFZZbC1Rqgq/cKoigh+
	v55JQs9flFWo9CuXZL1QO2nmjxrrUp46zYL3SE3WsqKw99Wf2ToDLv4/ySIu6hkPkOQ/gNT7+8f8y
	eWQEqMrKgHiLzKw7krniagq0P02iBT25KanJqFmHf9GGKDb/qVS9CFdHBI0hpYOQXzEGM8Ze8mSia
	srkhS6F1otOS1EnkfwMadFj9qU3//ERHI8HoQKKK0A7WRIwKuACRkMz9hRJxlhWLnjk0wdyyWhheM
	dDq5Z9u/6B354xtdpSzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW8bP-000000027IC-47cD;
	Sun, 07 Jun 2026 08:11:27 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW8bN-000000027GR-2Asw
	for kvm-riscv@lists.infradead.org;
	Sun, 07 Jun 2026 08:11:26 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-36d630c0e35so3313311a91.3
        for <kvm-riscv@lists.infradead.org>; Sun, 07 Jun 2026 01:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780819884; x=1781424684; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXyTBTDSB4kJ/NqnyBvVuRSbwI4TemATINDoQruBQBs=;
        b=pXOcx6npzOo8IJwJInC/PCPESL0kVL7oP7jVSJUktrWtT5x1gw8AJIMdbp8ciEPNv8
         YnlW1v9LGF6kzCJJJEwMNOwTnwzj+AcGz4u2WC6ivk2Ml18H/S3sG86fqItWSUVvC8UF
         SWT/gVGSigjTL7LOP3vHkkxZQox1CPjFTJ4mTNrzrHWA3W5178jrq3JF8cL0rAn+LxiT
         0TsVfy+SmXFHaQg4LVX4zHjpBDPNvI7NbQGFjNqqkDtMlCabcNB1wvYhNvRKqIDoNow4
         w+17VUXNxKLAct/6moOCciSJPX2JsIQjVQJdQ6pGGOwfEN8NxkOX97pt31sX2qHNuZcl
         IYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780819884; x=1781424684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JXyTBTDSB4kJ/NqnyBvVuRSbwI4TemATINDoQruBQBs=;
        b=ZSLSiVRuZG/QSkzlDL4Bp7OsIk7mkUPvaPxWZiI7z4BkOMh31s8IGyhPss7SyDicOG
         GWStQVxfCh4XNgn26lwuSKslAYUfgSPa9VYNuDb0JrzmfETlrDYTNPyvQiMQePLv2S/j
         fBaqd3Qk4+XIuKxHbIXMLbo1qYY2Cv5LRiXc/UOQ0PSh7Eu1QsTEjxNQRHNKKBtPli9x
         sHjfCoaGGIUCvmdiNCXBKN3I5NVnJITNLXOcpJKWNSIoAGj33XRbqBJGktajrF9qm5zc
         zalDE/0kp0P/cj6uJIwF6jKZ4QTQRCRAgxaCKWDywJOhUYey9+MbYNVuFwbTOSgpFWJe
         GYAw==
X-Forwarded-Encrypted: i=1; AFNElJ+lRPzdgNwtIkwT7kiF6NL9nJPe8tQXRSUGIwSnG1SSY4v+kYaODSEdOx70FXejMQuWd2ot7MLLuUk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzF0zR9K34a08EsWpqNkUjZFwGKKQyYGTmQ4hzXrDAP0wkB6yiS
	JHgYFPli3Fv9H0f3fhUN2ryvgMqtyV0DgLdkwD4cOqwdHCRN6dWX+1+D
X-Gm-Gg: Acq92OFn5RS6vUUf8ujIIZgtY/Xe6kSsqrrBOuqKgViGYonaNlgFPGBNvfnsDuaXpHl
	4wqI7D0QDJyT53JLZAzRppIGPJxgD3ySRI5vkPKb50zII1Y7dgnYJq0dntwJt6dfpIUx0CovJWL
	YDSsuuzx9jI2f/ik+rXGaCbAo3yFSxJwY3ooxeDhShNYKp4vW62Dqz/Weln1TZXV6LsyY1XNuWt
	PgECcqAOOPQic+mYhy1Kjdu0mUCa71lDj+f5ZqFGm6ovKs2sZs3mztm+YTnwmcMQL6Tkb8inOqW
	K09rkZuLCv9SDE9habPl0Gce/k5L8VSraHmEf+1eQI3pSEoEKPZ6d1O/+VLzyCLjLVu9/xlMYVs
	v8NezYD0XFMlqT7AERRv5mslzt6BYviycUo77s1rt1PDQLhfRLNUd/OxEc0jkZL7Xm8u52RkLPj
	hPCXX9dWxHga2dRVeXyOLMXY8cneTzOmbXig==
X-Received: by 2002:a17:90b:6c3:b0:36d:b9c5:e8f6 with SMTP id 98e67ed59e1d1-370f0481909mr12811244a91.19.1780819884574;
        Sun, 07 Jun 2026 01:11:24 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828821ddsm14362164b3a.35.2026.06.07.01.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 01:11:24 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v3 3/8] RISC-V: KVM: Allow Zicfiss/Zicfilp extensions for Guest/VM
Date: Sun,  7 Jun 2026 16:10:59 +0800
Message-ID: <20260607081105.993908-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260607081105.993908-1-inochiama@gmail.com>
References: <20260607081105.993908-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_011125_572799_5E9230DD 
X-CRM114-Status: UNSURE (   8.40  )
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

Extend the KVM ISA extension array to allow KVM userspace to
detect and enable Zicfiss/Zicfilp extensions for Guest/VM.

Assisted-by: YuanSheng:claude-4.7-opus
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 2 ++
 arch/riscv/kvm/isa.c              | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 7bbea8812d92..a27de850fa4c 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -199,6 +199,8 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZCLSD,
 	KVM_RISCV_ISA_EXT_ZILSD,
 	KVM_RISCV_ISA_EXT_ZALASR,
+	KVM_RISCV_ISA_EXT_ZICFILP,
+	KVM_RISCV_ISA_EXT_ZICFISS,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/isa.c b/arch/riscv/kvm/isa.c
index 1132d909cc25..9852a91fdecc 100644
--- a/arch/riscv/kvm/isa.c
+++ b/arch/riscv/kvm/isa.c
@@ -65,6 +65,8 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZICBOP),
 	KVM_ISA_EXT_ARR(ZICBOZ),
 	KVM_ISA_EXT_ARR(ZICCRSE),
+	KVM_ISA_EXT_ARR(ZICFILP),
+	KVM_ISA_EXT_ARR(ZICFISS),
 	KVM_ISA_EXT_ARR(ZICNTR),
 	KVM_ISA_EXT_ARR(ZICOND),
 	KVM_ISA_EXT_ARR(ZICSR),
-- 
2.54.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
