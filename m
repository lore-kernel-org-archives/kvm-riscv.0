Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 479C7C2D0CD
	for <kvm-riscv@archiver.kernel.org>; Thu, 15 May 2025 14:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qGyt+rxFZqsUVGGanf4z1dktEiUbD/2YnjbzGeGZDn8=; b=yM9y3aPeCu6KV6
	gP+hhl/TKUKeeiNPtL6ChruUN5sRHPXV3jS7VJdpykHeGjMnNAqHSWGGx8tpkLG96HjjWVc7D1PfR
	ufQRpc30Y9lD1EHx1K0cnATKGwgdcVg9M4zrdXbFiWkLZknjoD6R5zIcBLBylsSg5ft+QuUSAKqKZ
	j4bwr7KfQk7LHdN0XklBvDvkvJTDc70Wlez9tsTXJS20J32m3nU+dVLtazWmCHao09oop32oXiKHz
	AYh4ynMG3qfd8jjtwXjoN3wowAJB6CEaKYqPWFYTQxcn+URfwqbTY7EIDqwNilUd9gSBnwn4sJl0q
	n/9JbhUJvCAmTcJBcb+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFa3v-00000000yK8-3fzk;
	Thu, 15 May 2025 14:59:55 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZxA-00000000wvE-28va
	for kvm-riscv@lists.infradead.org;
	Thu, 15 May 2025 14:52:57 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-442e9c7cf0eso673485e9.2
        for <kvm-riscv@lists.infradead.org>; Thu, 15 May 2025 07:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747320774; x=1747925574; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JBNMBVMfrCwOqVA/j6iAZ2xlfGUT5Oj6Dz/mC6Rjl5s=;
        b=UDnRGQciiYsYnPKeoOhBiXsqQCPmmAtl2jR2eHFYSHKQoerzydagTcj/2rd+qkpnj1
         FTpMNzerObG5GU5YBKwVIuUNGpL3iLyhKpzsfO5mL0mnB4Z66QiCroakod/1kEj2assc
         8UmRRn2t+Q5D2z64UE+SLYyQCB75QnrhUKTbVQ6/vZQ/RqVozvEgeqojaxcHo5zu8XgM
         cK0FS69nrhennBEgY7k0Pa4LLsap+LywQazbzn83lhdbdtZBRq3AVvGrPpicfOrteOMX
         d8oR0vlRy5Qsp0jyn+l3o39ghm/muTh40yly3VBPP1J8ZDzqZVTQ/QgAjZZcJC08gyqV
         Q7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747320774; x=1747925574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JBNMBVMfrCwOqVA/j6iAZ2xlfGUT5Oj6Dz/mC6Rjl5s=;
        b=IL4KSsmxRgo3MWkUzrAv+ujH/lMAlnVlJwT3e082XoVL5uEw8yi1z2Uh5b/AEEfE9h
         p4KMOM+ls/oBo9BD8h5Sv8mycd9JKE50q3/GhOX3ODuE4Lb6KPMY+iGrwedg/fiCssUK
         0B+xRwZiQL4/H+M1B4mMtIW4gawYbfuF3woptM85hJrgagE0bXThna8xMWPymSverXHx
         ymd2IUXOeKfdK2kRHLOZ7yLYChqzU8keMnAuAoBRtPpGkhpfN/dQu8JHcalgorRlHl2q
         wK/YsNh8sr4oG8G0gVMCz8hIveR0L6pwfkY1lS/UoOgsOCGo4pY6TuQthaSCI2GmRTGT
         w8vA==
X-Gm-Message-State: AOJu0YyQottzpJQjtX41cDzb62G0JVqnmwFqtM8/INq9KnxuXvCZBsiH
	g4Po4/0md53ZB1w51Hm7eZvjCD+PqnKeUEXCCcUJwOWLOgPbZy6LAL6SZB7qmmBLjDRya8unvYB
	h
X-Gm-Gg: ASbGncsQMrYHmnIsO7ZYL3Uubg++FKcgIe6eQTBzKvxvfXHRl20HIFkkh19y3mG8fNk
	nlmLC9V1ryfvO0YvqroBmgYUsrahTbR4dHFMeI3TYYChJ6pb1tRvbINA+HDML+6jue61JbQ32gE
	BbGCh7UU2UjD0HE2U2hNDQhQx4faEJ46c0bU6TalwQhxsmG4lD1to9iNMDGC1pM3wbFZdDVgFYE
	yL7GejTWniB9SFT5odPUPRM9x1RA+x0w4t1xxNbZYYmQEMgEqI0z5CoZSCOvkwCqHL6cDreeJi9
	iNiOjijC4CNgkUgaLJwcx6DbNgq5obDI9FXZd9M2mjenGn83T2PED9Op
X-Google-Smtp-Source: AGHT+IEjWdfaSstCa6WtRNHMXeY5NKPx+dlpO0u8cbQ+/wmwqBYSpQzl4SUc23EpyvhrjvwJhEHmXw==
X-Received: by 2002:a05:600c:1384:b0:43d:2318:ed7f with SMTP id 5b1f17b1804b1-442f1ddcf8emr28595905e9.0.1747320773678;
        Thu, 15 May 2025 07:52:53 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:59f5:9ec:79d9:ffc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3951a97sm75040025e9.23.2025.05.15.07.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 07:52:53 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: kvm-riscv@lists.infradead.org
Cc: kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v3 0/2] RISC-V: KVM: VCPU reset fixes
Date: Thu, 15 May 2025 16:37:24 +0200
Message-ID: <20250515143723.2450630-4-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_075256_548419_AF95841A 
X-CRM114-Status: UNSURE (   7.71  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgp0aGUgZGVzaWduIHN0aWxsIHJlcXVpcmVzIGEgZGlzY3Vzc2lvbi4KClt2MyAxLzJd
IHJlbW92ZXMgbW9zdCBvZiB0aGUgYWRkaXRpb25hbCBjaGFuZ2VzIHRoYXQgdGhlIEtWTSBjYXBh
YmlsaXR5CndhcyBkb2luZyBpbiB2Mi4gIFt2MyAyLzJdIGlzIG5ldyBhbmQgcHJldmlld3MgYSBn
ZW5lcmFsIHNvbHV0aW9uIHRvIHRoZQpsYWNrIG9mIHVzZXJzcGFjZSBjb250cm9sIG92ZXIgS1ZN
IFNCSS4KCkEgcG9zc2libGUgUUVNVSBpbXBsZW1lbnRhdGlvbiBmb3IgYm90aCBjYXBhYmlsaXRp
ZXMgY2FuIGJlIHNlZW4gaW4KaHR0cHM6Ly9naXRodWIuY29tL3JhZGlta3JjbWFyL3FlbXUvdHJl
ZS9yZXNldF9maXhlc192MwpUaGUgbmV4dCBzdGVwIHdvdWxkIGJlIHRvIGZvcndhcmQgdGhlIEhT
TSBlY2FsbHMgdG8gUUVNVS4KCnYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9rdm0tcmlzY3Yv
MjAyNTA1MDgxNDI4NDIuMTQ5NjA5OS0yLXJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbS8KdjE6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2t2bS1yaXNjdi8yMDI1MDQwMzExMjUyMi4xNTY2NjI5LTMt
cmtyY21hckB2ZW50YW5hbWljcm8uY29tLwoKUmFkaW0gS3LEjW3DocWZICgyKToKICBSSVNDLVY6
IEtWTTogYWRkIEtWTV9DQVBfUklTQ1ZfTVBfU1RBVEVfUkVTRVQKICBSSVNDLVY6IEtWTTogYWRk
IEtWTV9DQVBfUklTQ1ZfVVNFUlNQQUNFX1NCSQoKIERvY3VtZW50YXRpb24vdmlydC9rdm0vYXBp
LnJzdCAgICAgICAgfCAyMiArKysrKysrKysrKysrKysrKysrKysrCiBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2t2bV9ob3N0LmggICAgIHwgIDYgKysrKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2t2bV92Y3B1X3NiaS5oIHwgIDEgKwogYXJjaC9yaXNjdi9rdm0vdmNwdS5jICAgICAgICAgICAg
ICAgICB8IDI3ICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQogYXJjaC9yaXNjdi9rdm0vdmNw
dV9zYmkuYyAgICAgICAgICAgICB8IDI3ICsrKysrKysrKysrKysrKysrKysrKysrKystLQogYXJj
aC9yaXNjdi9rdm0vdm0uYyAgICAgICAgICAgICAgICAgICB8IDE4ICsrKysrKysrKysrKysrKysr
KwogaW5jbHVkZS91YXBpL2xpbnV4L2t2bS5oICAgICAgICAgICAgICB8ICAyICsrCiA3IGZpbGVz
IGNoYW5nZWQsIDg4IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQoKLS0gCjIuNDkuMAoK
Ci0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
