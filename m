Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD4BC3ABC9
	for <kvm-riscv@archiver.kernel.org>; Fri, 16 May 2025 14:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MYzxx/xlHAqnQfmAXTc4DLLJ6a6VO3PfQX5g24ob/X8=; b=GGgk9cA/EvUzEQ
	93boL///IHLJkmZDlmGuSVhPj1lMPWyBU+kvSpUVACqLtWUTeHnfvD6N6vxm7Ad0/+bggVStfwbJS
	d/PY4FbIg/7++rNL2yNGwOlBUw6v28NvvqG1daff6rSNQV2jAvjsNrKCH+W4gsSA7GADiWXaMB5mO
	walmyaex14rvU9nwWo5SC3fhLKRjQP5dgg3Xw8XMn2hhuO/5V9/tOlMap95AQnCqYl/s2j9x+uzMT
	LWB9/quNgmTXxU+u8ioIM8dH5iTEfECMTGAvLSslcjXMTkCLqpXWOHhrSorG5oDjDb2xGN5GZ1rpF
	K3rKTQZ7/kisZhJ3SY9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwL4-00000003iDJ-0rJA;
	Fri, 16 May 2025 14:47:06 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvjO-00000003cGQ-0BDb
	for kvm-riscv@lists.infradead.org;
	Fri, 16 May 2025 14:08:12 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so24483885e9.3
        for <kvm-riscv@lists.infradead.org>; Fri, 16 May 2025 07:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747404488; x=1748009288; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k/BNsmKtmxng+uJwxYfVRzr1UYXziJ1APu78MxCAAdI=;
        b=vzoHh1GfSPwnA+4wXdEWUeoIUzMnWwYuib9kTu8XFik2ZMFdswLDB3vRNRAn4vjOaJ
         zK62tNULR3JmfkDkbvcOxy8yrC2X2cuYKF+rb6rAZUUPmZB6Qd0ni7TBbisdSb7REW7g
         oD8hC8mdo+x5zeWtV7BLwiCOmITqwy26wlMcNBGHUkoPbmj72OkfH2L3p4DAc6snNi/Z
         RpI4PJpVz6erf8+jgzyble+++Dc+8p7zn0Ym8K8rebV0XvqEGUWhP0Y4Xb6jkhRitAQT
         P5dEOs6Bz0EOS2jnR6y4bZ0Uylk91DoE9kTp/dEJWA52KCHJdJqcGZtlCpaNOo0qUJEr
         kSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747404488; x=1748009288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k/BNsmKtmxng+uJwxYfVRzr1UYXziJ1APu78MxCAAdI=;
        b=MeE2vLV1a/kSksBj5g8T1+ban70zDyhNb62ajI6YnspACXSHN/IY7UW2VK8rYzjJJS
         wxcVDEeEUPWL1LdfhOL3v0uh+hOVx/nIG1utsrnEQLVISXe0RliuR1xkRzb5tVgI793Q
         PdyUjtxkQe6sLOgN2YzY0vAXCxwq5t+Ovaq6mEvj4fioihJZ2EIk9CDmroCYVL0/K8Gl
         WvI0yfQbLJFfubrJt0II+uPjphVSWI5Sg0N6A2buW7ZqMKr167hOWMrcTOuJzrOGeGHN
         MEJgJ9+RrIbK06/BH6Wd4oiorVEgadsPSYTJyZZdGc6n+ZeHnng2xyevbKpJyJLI7OCF
         Gh+A==
X-Forwarded-Encrypted: i=1; AJvYcCUFZYqYL/vhwsXgcgA7cAeYJgflRlSiUxlOXGFtFHKpV8znCFxiI0Y/xDhRQ3V7QAwrqWTeMBWWHCU=@lists.infradead.org
X-Gm-Message-State: AOJu0YypmF1resoNmkRzNTFQgne2BDph47B/uyLAeMkodKlToFgmzqbt
	EOBl2vUkBC2aF4q50Nk4oF/9hsQuINX7gX2Har3qhMJzWnQbGQTmnQTCpw7P18YDJd0=
X-Gm-Gg: ASbGncvw8fIKm7xxTr0HbSqpq/xIRdiFwoFXuJCwZAmkWIjsFD8IJlWCOrp2EjnCywt
	gKSSw4N7QuUPh3tweZ/XldwfAzw1jtesWCQh+HPGk8AgEVwFGDx2PDr1cj8VpeLbfy9AP2ZQL01
	+Wtg0ijwkmzA3JeRJH+kdigUXlujWuC9qCYC8KFwS7NpVt2r6EjS7pt02OqHEcrIi4/hbmtCAh8
	JHLc6p3I+s7dnjL0NOTU0GUbI6PQNpi1ymvhB27Kl+xnUoLoIuYHSEJNsusRBCDFpmZBmQ7rwQF
	2h5FVUVTF1dxXZnapR6PAsT00QJxZvuhyiXWJ0JNC/i5fVs3OIiwx92GukvFG182DS8nXS+o
X-Google-Smtp-Source: AGHT+IGq36WEEdwcj2F1kc98tOimoY9E+6SHXs/IqyOGwvA6IL+/S0Nt0+GgQYvZ1hvDj9xey6cGow==
X-Received: by 2002:a05:600c:524d:b0:442:e109:3027 with SMTP id 5b1f17b1804b1-442fd6649bdmr38117515e9.24.1747404487692;
        Fri, 16 May 2025 07:08:07 -0700 (PDT)
Received: from alex-rivos.lan ([2001:861:3382:ef90:b6d5:4f19:6a91:78f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39e852fsm113910005e9.27.2025.05.16.07.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 07:08:07 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4 0/3] Move duplicated instructions macros into asm/insn.h
Date: Fri, 16 May 2025 16:08:02 +0200
Message-Id: <20250516140805.282770-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_070810_346815_ED579164 
X-CRM114-Status: UNSURE (   7.01  )
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

VGhlIGluc3RydWN0aW9ucyBwYXJzaW5nIG1hY3JvcyB3ZXJlIGR1cGxpY2F0ZWQgYW5kIG9uZSBv
ZiB0aGVtIGhhZCBkaWZmZXJlbnQKaW1wbGVtZW50YXRpb25zLCB3aGljaCBpcyBlcnJvciBwcm9u
ZS4KClNvIGxldCdzIGNvbnNvbGlkYXRlIHRob3NlIG1hY3JvcyBpbiBhc20vaW5zbi5oLgoKdjE6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjUwNDIyMDgyNTQ1LjQ1MDQ1
My0xLWFsZXhnaGl0aUByaXZvc2luYy5jb20vCnYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1yaXNjdi8yMDI1MDUwODA4MjIxNS44ODY1OC0xLWFsZXhnaGl0aUByaXZvc2luYy5jb20v
CnYzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI1MDUwODEyNTIwMi4x
MDg2MTMtMS1hbGV4Z2hpdGlAcml2b3NpbmMuY29tLwoKQ2hhbmdlcyBpbiB2NDoKLSBSZWJhc2Ug
b24gdG9wIG9mIGZvci1uZXh0IChvbiB0b3Agb2YgNi4xNS1yYzYpCgpDaGFuZ2VzIGluIHYzOgot
IEZpeCBwYXRjaCAyIHdoaWNoIGNhdXNlZCBidWlsZCBmYWlsdXJlcyAobGludXggcmlzY3YgYm90
KSwgYnV0IHRoZQogIHBhdGNoc2V0IGlzIGV4YWN0bHkgdGhlIHNhbWUgYXMgdjIKCkNoYW5nZXMg
aW4gdjI6Ci0gUmViYXNlIG9uIHRvcCBvZiA2LjE1LXJjNQotIEFkZCBSQiB0YWdzCi0gRGVmaW5l
IFJWX1goKSB1c2luZyBSVl9YX21hc2soKSAoQ2zDqW1lbnQpCi0gUmVtb3ZlIHVudXNlZCBkZWZp
bmVzIChDbMOpbWVudCkKLSBGaXggdGFidWxhdGlvbnMgKERyZXcpCgpBbGV4YW5kcmUgR2hpdGkg
KDMpOgogIHJpc2N2OiBGaXggdHlwbyBFWFJBQ1QgLT4gRVhUUkFDVAogIHJpc2N2OiBTdHJlbmd0
aGVuIGR1cGxpY2F0ZSBhbmQgaW5jb25zaXN0ZW50IGRlZmluaXRpb24gb2YgUlZfWCgpCiAgcmlz
Y3Y6IE1vdmUgYWxsIGR1cGxpY2F0ZSBpbnNuIHBhcnNpbmcgbWFjcm9zIGludG8gYXNtL2luc24u
aAoKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaW5zbi5oICAgICAgICAgIHwgMjA2ICsrKysrKysr
KysrKysrKysrKysrKystLS0KIGFyY2gvcmlzY3Yva2VybmVsL21hY2hpbmVfa2V4ZWNfZmlsZS5j
IHwgICAyICstCiBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgICB8IDE0NCAr
LS0tLS0tLS0tLS0tLS0tLQogYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMgICAgICAgICAgICAg
fCAgIDIgKy0KIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfaW5zbi5jICAgICAgICAgICAgIHwgMTI4ICst
LS0tLS0tLS0tLS0tLQogNSBmaWxlcyBjaGFuZ2VkLCAxODggaW5zZXJ0aW9ucygrKSwgMjk0IGRl
bGV0aW9ucygtKQoKLS0gCjIuMzkuMgoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
