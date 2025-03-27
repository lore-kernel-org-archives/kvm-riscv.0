Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1D0C36011
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 19:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LHSk8ofJQFPGHwq1WC/pHXfH7MdfZbaWv4VoXeddgm4=; b=UamR/t4D+nYhOd
	jUU9Q81GNJhXyHsCD2ev3HBdTWnAeX3W7k9i9pXrN9z8F31e7gLKfNrSoInW0RP0s9VR8QdEpoASV
	DxRQaVxTw3T8gvZtjLdYn4viZcwzWTlf9FZan09z3d4WY6QvWrBsyz/+qFHA9XocJd6nR86pqKxg0
	ThNGka/+q+h2ibbcT34HMA730QNTajvFu/TB+tLNYBsvZSuyY5XoRvG/eAQa+Kjifyhq7W209VSEp
	m1VJPBEYt7ybNu5z2pZBtolxQYWELhHz5d5UEWviIZV8bQ1iW24QqBzAYDKlV7yvTQo+pB9Ujx+Yp
	8lP2/MqkbSWgmQZosrsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt3G-0000000BqCQ-2EjB;
	Thu, 27 Mar 2025 19:38:06 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt1T-0000000BpTr-2BNQ
	for kvm-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 19:36:19 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3015001f862so1663702a91.3
        for <kvm-riscv@lists.infradead.org>; Thu, 27 Mar 2025 12:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104175; x=1743708975; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNiDOpzl6VVeJNgjlyJ9nrrgFT7wIm7QDa1NpBXt1X8=;
        b=U9KuN5eOMxktPxQHIMrMJlE3JUjzd/DFXyphmpGgnJAq372GGhHnceaa3fzYMVvaeI
         +QTDfRt1P57589CO3BWqmFO15vS4tyxcxkTHGjaODWTDIp0G0SwDGjelxef/iguO1t2y
         U1oUKbA3CgnIVVED9+NL3TkFLrKRQqMhwe0tRCUdNMZ6s8xKJL35Z3qFxSizA4PSZNzx
         9MI4mTQPZAwj7vQMyOVKZbFgVkcmjmsFtOWajB1Tr1XKUxPO+Us4+uhBj92CNW2yQma8
         5pUvc5v2so28uN9KtUgn0EeXezQSQlXt15BaJ8XbM62wdUHxFgTG6E6+CgsxsPfIQfVx
         mmiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104175; x=1743708975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNiDOpzl6VVeJNgjlyJ9nrrgFT7wIm7QDa1NpBXt1X8=;
        b=ZHVKxBeMBu3acNahaIuIUbJ5kxeQpAjOLdJFmG7C0cJJoF/9XZFpVy8T7gvYQnh9gH
         18SqhHphuAb1XlTrt5kiGds7S72kDheKydryAjqjbbo7/cy5HkT4UU4oVrtvsDayDz0/
         uJEwGlqsPR01KTLf6wWIMX14sznokbpETVP8dl3J0TQDOKCNdTW6Vu18ZYbIkgAC1Ztp
         qL/0y/tRFKw3PHBTzswXmrG+DZKuMA07ZM6ARn6Ii34uE9CH7PzTUwQciflSBv+i1B3d
         W/phuB88IqiAcP6EhaRP8ErI4hDdzSseROn+mjRtUaQShiPrDG83rt8hxnjlw68vA94M
         0LVw==
X-Forwarded-Encrypted: i=1; AJvYcCUJHg/Qgt156dEEkc9OEgpQSTLBnTtpWNkFpnzjGP4Fehztjm3sb/WxCmTJLwqUxbazx71jnt0XihE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxfktsqahy2RWk8DCFVyokPdPic2lcCJxtuEekrnXCxM17XlUMu
	y3RL7P4bpzrPEMvJCW3+/bhdmhD/636U4trqSDFoJkR6pzGakKzBErA1QTtjMoU=
X-Gm-Gg: ASbGncumOfnNeUgsW0ZU5fp8d9xiVtuOtTqFFXLkaKtLHIPP/y9T6QIAfCWMxpn2f7v
	H0VlDgl1wsbq9SwJ751Y8qJbh0MMGlxLdNmW8AwUuz2H5ZWsqsyR56h1iwbj07PQObPDG++VPNk
	tL3gmKJE8DBSnRWgfOpN4ZCLVGcFTfH3rTN+f67XU/SKm1t3Z4H5F3UULLqDkOKhwC0Bl+RyNrD
	mbMv+NgTkiIrpGVVIOb7J92/sB+Ah9nMj23ndhK2xgLwlIzIjZYmXyKHMYS4/TLH+yoOoeYCr59
	Sw5zqvFRzuD9l8sL8O14dEjjaGqNgKz46tlNbzot9SSik+ak2kSefDyfuA==
X-Google-Smtp-Source: AGHT+IE+y9OOA1EBKtpBON1MPRGyOf1+3dniyWNGs1euEGYpPv+8H/XM0XTNXU8WsHLC0qF7ObKE3w==
X-Received: by 2002:a17:90a:d44f:b0:2ea:a9ac:eee1 with SMTP id 98e67ed59e1d1-303a7d6a7ffmr7665632a91.10.1743104174834;
        Thu, 27 Mar 2025 12:36:14 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:14 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 27 Mar 2025 12:35:43 -0700
Subject: [PATCH v5 02/21] RISC-V: Add Sxcsrind ISA extension CSR
 definitions
MIME-Version: 1.0
Message-Id: <20250327-counter_delegation-v5-2-1ee538468d1b@rivosinc.com>
References: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
In-Reply-To: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>, Kaiwen Xue <kaiwenx@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_123615_558565_4FDA9B23 
X-CRM114-Status: UNSURE (   8.95  )
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

RnJvbTogS2Fpd2VuIFh1ZSA8a2Fpd2VueEByaXZvc2luYy5jb20+CgpUaGlzIGFkZHMgZGVmaW5p
dGlvbnMgb2YgbmV3IENTUnMgYW5kIGJpdHMgZGVmaW5lZCBpbiBTeGNzcmluZCBJU0EKZXh0ZW5z
aW9uLiBUaGVzZSBDU1IgZW5hYmxlcyBpbmRpcmVjdCBhY2Nlc3NlcyBtZWNoYW5pc20gdG8gYWNj
ZXNzCmFueSBDU1JzIGluIE0tLCBTLSwgYW5kIFZTLW1vZGUuIFRoZSByYW5nZSBvZiB0aGUgc2Vs
ZWN0IHZhbHVlcwphbmQgaXJlZyB3aWxsIGJlIGRlZmluZSBieSB0aGUgSVNBIGV4dGVuc2lvbiB1
c2luZyBTeGNzcmluZCBleHRlbnNpb24uCgpTaWduZWQtb2ZmLWJ5OiBLYWl3ZW4gWHVlIDxrYWl3
ZW54QHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJp
dm9zaW5jLmNvbT4KU2lnbmVkLW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5j
b20+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCB8IDMwICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9jc3IuaAppbmRleCA2ZmVkNDJlMzc3MDUuLmJjZTU2YTgzYzM4NCAxMDA2NDQKLS0tIGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2Nzci5oCkBAIC0zMzMsNiArMzMzLDEyIEBACiAvKiBTdXBlcnZpc29yLUxldmVsIFdpbmRvdyB0
byBJbmRpcmVjdGx5IEFjY2Vzc2VkIFJlZ2lzdGVycyAoQUlBKSAqLwogI2RlZmluZSBDU1JfU0lT
RUxFQ1QJCTB4MTUwCiAjZGVmaW5lIENTUl9TSVJFRwkJMHgxNTEKKy8qIFN1cGVydmlzb3ItTGV2
ZWwgV2luZG93IHRvIEluZGlyZWN0bHkgQWNjZXNzZWQgUmVnaXN0ZXJzIChTeGNzcmluZCkgKi8K
KyNkZWZpbmUgQ1NSX1NJUkVHMgkJMHgxNTIKKyNkZWZpbmUgQ1NSX1NJUkVHMwkJMHgxNTMKKyNk
ZWZpbmUgQ1NSX1NJUkVHNAkJMHgxNTUKKyNkZWZpbmUgQ1NSX1NJUkVHNQkJMHgxNTYKKyNkZWZp
bmUgQ1NSX1NJUkVHNgkJMHgxNTcKIAogLyogU3VwZXJ2aXNvci1MZXZlbCBJbnRlcnJ1cHRzIChB
SUEpICovCiAjZGVmaW5lIENTUl9TVE9QRUkJCTB4MTVjCkBAIC0zODAsNiArMzg2LDE0IEBACiAv
KiBWUy1MZXZlbCBXaW5kb3cgdG8gSW5kaXJlY3RseSBBY2Nlc3NlZCBSZWdpc3RlcnMgKEgtZXh0
ZW5zaW9uIHdpdGggQUlBKSAqLwogI2RlZmluZSBDU1JfVlNJU0VMRUNUCQkweDI1MAogI2RlZmlu
ZSBDU1JfVlNJUkVHCQkweDI1MQorLyoKKyAqIFZTLUxldmVsIFdpbmRvdyB0byBJbmRpcmVjdGx5
IEFjY2Vzc2VkIFJlZ2lzdGVycyAoSC1leHRlbnNpb24gd2l0aCBTeGNzcmluZCkKKyAqLworI2Rl
ZmluZSBDU1JfVlNJUkVHMgkJMHgyNTIKKyNkZWZpbmUgQ1NSX1ZTSVJFRzMJCTB4MjUzCisjZGVm
aW5lIENTUl9WU0lSRUc0CQkweDI1NQorI2RlZmluZSBDU1JfVlNJUkVHNQkJMHgyNTYKKyNkZWZp
bmUgQ1NSX1ZJU1JFRzYJCTB4MjU3CiAKIC8qIFZTLUxldmVsIEludGVycnVwdHMgKEgtZXh0ZW5z
aW9uIHdpdGggQUlBKSAqLwogI2RlZmluZSBDU1JfVlNUT1BFSQkJMHgyNWMKQEAgLTQyMiw2ICs0
MzYsMTIgQEAKIC8qIE1hY2hpbmUtTGV2ZWwgV2luZG93IHRvIEluZGlyZWN0bHkgQWNjZXNzZWQg
UmVnaXN0ZXJzIChBSUEpICovCiAjZGVmaW5lIENTUl9NSVNFTEVDVAkJMHgzNTAKICNkZWZpbmUg
Q1NSX01JUkVHCQkweDM1MQorLyogTWFjaGluZS1MZXZlbCBXaW5kb3cgdG8gSW5kaXJlY3RseSBB
Y2Nlc3NlZCBSZWdpc3RlcnMgKFN4Y3NyaW5kKSAqLworI2RlZmluZSBDU1JfTUlSRUcyCQkweDM1
MgorI2RlZmluZSBDU1JfTUlSRUczCQkweDM1MworI2RlZmluZSBDU1JfTUlSRUc0CQkweDM1NQor
I2RlZmluZSBDU1JfTUlSRUc1CQkweDM1NgorI2RlZmluZSBDU1JfTUlSRUc2CQkweDM1NwogCiAv
KiBNYWNoaW5lLUxldmVsIEludGVycnVwdHMgKEFJQSkgKi8KICNkZWZpbmUgQ1NSX01UT1BFSQkJ
MHgzNWMKQEAgLTQ2Nyw2ICs0ODcsMTEgQEAKICMgZGVmaW5lIENTUl9JRUgJCUNTUl9NSUVICiAj
IGRlZmluZSBDU1JfSVNFTEVDVAlDU1JfTUlTRUxFQ1QKICMgZGVmaW5lIENTUl9JUkVHCUNTUl9N
SVJFRworIyBkZWZpbmUgQ1NSX0lSRUcyCUNTUl9NSVJFRzIKKyMgZGVmaW5lIENTUl9JUkVHMwlD
U1JfTUlSRUczCisjIGRlZmluZSBDU1JfSVJFRzQJQ1NSX01JUkVHNAorIyBkZWZpbmUgQ1NSX0lS
RUc1CUNTUl9NSVJFRzUKKyMgZGVmaW5lIENTUl9JUkVHNglDU1JfTUlSRUc2CiAjIGRlZmluZSBD
U1JfSVBICQlDU1JfTUlQSAogIyBkZWZpbmUgQ1NSX1RPUEVJCUNTUl9NVE9QRUkKICMgZGVmaW5l
IENTUl9UT1BJCUNTUl9NVE9QSQpAQCAtNDkyLDYgKzUxNywxMSBAQAogIyBkZWZpbmUgQ1NSX0lF
SAkJQ1NSX1NJRUgKICMgZGVmaW5lIENTUl9JU0VMRUNUCUNTUl9TSVNFTEVDVAogIyBkZWZpbmUg
Q1NSX0lSRUcJQ1NSX1NJUkVHCisjIGRlZmluZSBDU1JfSVJFRzIJQ1NSX1NJUkVHMgorIyBkZWZp
bmUgQ1NSX0lSRUczCUNTUl9TSVJFRzMKKyMgZGVmaW5lIENTUl9JUkVHNAlDU1JfU0lSRUc0Cisj
IGRlZmluZSBDU1JfSVJFRzUJQ1NSX1NJUkVHNQorIyBkZWZpbmUgQ1NSX0lSRUc2CUNTUl9TSVJF
RzYKICMgZGVmaW5lIENTUl9JUEgJCUNTUl9TSVBICiAjIGRlZmluZSBDU1JfVE9QRUkJQ1NSX1NU
T1BFSQogIyBkZWZpbmUgQ1NSX1RPUEkJQ1NSX1NUT1BJCgotLSAKMi40My4wCgoKLS0gCmt2bS1y
aXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
