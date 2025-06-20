Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32BCC7115B
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 20:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nK3rZApdst/nOYxNfnrCSC+yxlXF9/1Wij5Rcuh8/EI=; b=yDnnBLrbfa43nZ
	EZj1UgnqTvKlt7LCMdLZse0b8swj5MRXjhubmtg7wi39VnWSuXiOccZxmasWV1u5jV3lJWFDSPF1t
	2NS9Bjzu/Rj1/4ud1XlwzmW46umhe4X3RzVGqQCG4gawxZ4dq73fF+Cs6K9+P5Jjvmzp3PR06/gIM
	nr1PtTdGINqrJywoaTfZ1MiHNuoXf99o78P91Z07gYjbiFjq7ved05+Vnp8oXst8skpMfBomUnoSt
	weqL33kECQ7xETkPmIU/F1Kwp0xXZJmzkukOp5OlVN1CMTnsxbR+XvELKXXv584PcqXYWnJoYMpjE
	oP4kkRYhZQXMcBEMfS7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSiGi-0000000GWXx-28rs;
	Fri, 20 Jun 2025 20:23:24 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSiFY-0000000GWG8-3ViV
	for kvm-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 20:22:15 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-23636167b30so21422185ad.1
        for <kvm-riscv@lists.infradead.org>; Fri, 20 Jun 2025 13:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750450932; x=1751055732; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zR93x1w6dXrRMkMadRB1UTNlrKc0W0v3FGDIv1ERUx4=;
        b=HLwcx28qS7TNQq4cFEJHx8oyioTtLdOmhEn/Guc6xhOkQJ+UHBJ/O89i0s5WlHYpLX
         0gxGQMbUoC5DVL3BD4J3xze58lmI77x7kXJuVzm1EPjcqvF98lfEXvhoSmDy/VF1sKM9
         6xTWz+4HUAzhpVXxD+87VAVmAF4NQLXxmz1eXvn9eDNnihjXqu4bfnOAtApiyEKspeNm
         k8E4tIZ9tqV9oip387gzRP3XVnbZFA2pr60mCrnvtWyHNxage5PERRNJKi9HRCBaJpwD
         XnslXl8oAbByJP/dT3TcDOxQo2vNKZ8b/l5SISYYHY17GZgGv1qSN8TgazdlSt6SyLaH
         /nkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750450932; x=1751055732;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zR93x1w6dXrRMkMadRB1UTNlrKc0W0v3FGDIv1ERUx4=;
        b=t3cmbxcY2r78oIf4ZbR+RD0BAKzGcFrXoFUAIvOp/72hjK6RSwPAWVIQirFBV/zVst
         JlcE0zlSlbe45HlKltHT6LKx/R3fxv61EEiRyexiiTZYtxIuSD6UTdA55nvStQ+po9sa
         alerrkGr02pKWi23IpZg98DSB+pd8gSKlREt4dp87T2V3hG9w76J9VdSmjNqD/d+0S72
         Zhz26DCFiPHePOJ9tSu1Yq4EGw8dXrFBsaCkTjWh+D+VtDeSTi1N7G0EMgN7nwpC9ixG
         WDXj+/jnJKIHtgmpHYIs2Yz+K5FjF8psWuhVVC978NqVirC+ORvQnP5OztqEUi0/5KpM
         22BQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF7fJdirrJFay7oZQDlKIZkqnsGUBJWwbXwU91YkWjES2dsRGRccSht4A6N/s/pDfon2kaNNupDMk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwNAfssRohqVU9Tjh6R5YlYJDORl1pt37UkyNBqMoMb4Lu+oSBk
	Ih+jyKbX6ChmoSIAN4n8fy2R20pmUohqC6nPm0Wtf4Stgpf8sUSiY/41lJRWfamwVRk=
X-Gm-Gg: ASbGncsa5qNOPrrkxhmDe6VpEhlJeug+eufRI94jOp2ng7MYOfRTDKlPCTeexPf3/Db
	IwS7z9olMRjjN+Jn7VbijfXowCFg8h+EQQ5OralE0kjDyrKj5BOV5XzjntVJPnC24atDtHUwz/D
	aKEJ6FxXPDJeq1lLAW/mIr1+iSokkjwbH7Oa5XUvDwDXUJbvHrpB65cGXoM7/Ccr3geFBQhObx0
	RYbi5M0vW1jFePRfpqlookkm159CRuOFqrYa74aweDsOdxTnUaM8LeATUANJ1ZUwA0pKUDQo8cs
	G6zrJi7cHQi70XXYs7mAW80eY8+QQ9wLK6SvsKqiC/hf6Z67wSygrjZHifsC6G/Jen62SQ51N9u
	b3MC3clG2zn8YcnGOdVmd8SChmuuIJufcaQ==
X-Google-Smtp-Source: AGHT+IGMjAKS+ZR6xDwRzLnhzjJTUfYEfrwovg8rbA1ebQN5xfuztY8xY8dqTmR5sIFHBMzmyc1fcA==
X-Received: by 2002:a17:903:3bc4:b0:224:10a2:cae7 with SMTP id d9443c01a7336-237d9981dc9mr67398695ad.40.1750450932143;
        Fri, 20 Jun 2025 13:22:12 -0700 (PDT)
Received: from alexghiti.eu.rivosinc.com (alexghiti.eu.rivosinc.com. [141.95.202.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d860fb58sm24239005ad.99.2025.06.20.13.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 13:22:11 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 0/3] Move duplicated instructions macros into asm/insn.h
Date: Fri, 20 Jun 2025 20:21:56 +0000
Message-Id: <20250620-dev-alex-insn_duplicate_v5_manual-v5-0-d865dc9ad180@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOTCVWgC/x3N0QrCMAxA0V8ZeTbQZVTQXxEpsc00UONoXRmM/
 bvFx/Ny7w5VikqF67BDkaZVP9bhTwPEF9tTUFM3kCPvzuQwSUPOsqFatZDWJWvkr4Tmw5tt5Yw
 UaRovY5zc/IDeWYrMuv0ft/tx/ADolUImcwAAAA==
X-Change-ID: 20250620-dev-alex-insn_duplicate_v5_manual-2c23191c30fb
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Andrew Jones <ajones@ventanamicro.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1777;
 i=alexghiti@rivosinc.com; h=from:subject:message-id;
 bh=zNnEbdShfnt7dg6Wnhs4FrAsA8snzs7PQOci4sCR+Cw=;
 b=owGbwMvMwCGWYr9pz6TW912Mp9WSGDJCD72P8Dn9w+tB9qn6mgksQSULDE+I5Uh+Cv1r/Vl9V
 zyHwHKNjlIWBjEOBlkxRRYF84SuFvuz9bP/XHoPM4eVCWQIAxenAExEO4Lhn2L99duffV9+4rU4
 c++cq1De1m3/N17SqX9TLrJw5+2jH7wYGZYK1y25xpz/NbrjiP2VGt+AsASb1/PY1jKVBUxeHRu
 TyA4A
X-Developer-Key: i=alexghiti@rivosinc.com; a=openpgp;
 fpr=DC049C97114ED82152FE79A783E4BA75438E93E3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_132213_026528_F9E44FC1 
X-CRM114-Status: UNSURE (   5.65  )
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
MDg2MTMtMS1hbGV4Z2hpdGlAcml2b3NpbmMuY29tLwp2NDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtcmlzY3YvMjAyNTA1MTYxNDA4MDUuMjgyNzcwLTEtYWxleGdoaXRpQHJpdm9zaW5j
LmNvbS8KCkNoYW5nZXMgaW4gdjU6Ci0gUmViYXNlIG9uIHRvcCBvZiA2LjE2LXJjMQoKQ2hhbmdl
cyBpbiB2NDoKLSBSZWJhc2Ugb24gdG9wIG9mIGZvci1uZXh0IChvbiB0b3Agb2YgNi4xNS1yYzYp
CgpDaGFuZ2VzIGluIHYzOgotIEZpeCBwYXRjaCAyIHdoaWNoIGNhdXNlZCBidWlsZCBmYWlsdXJl
cyAobGludXggcmlzY3YgYm90KSwgYnV0IHRoZQogIHBhdGNoc2V0IGlzIGV4YWN0bHkgdGhlIHNh
bWUgYXMgdjIKCkNoYW5nZXMgaW4gdjI6Ci0gUmViYXNlIG9uIHRvcCBvZiA2LjE1LXJjNQotIEFk
ZCBSQiB0YWdzCi0gRGVmaW5lIFJWX1goKSB1c2luZyBSVl9YX21hc2soKSAoQ2zDqW1lbnQpCi0g
UmVtb3ZlIHVudXNlZCBkZWZpbmVzIChDbMOpbWVudCkKLSBGaXggdGFidWxhdGlvbnMgKERyZXcp
CgpTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+
Ci0tLQpBbGV4YW5kcmUgR2hpdGkgKDMpOgogICAgICByaXNjdjogRml4IHR5cG8gRVhSQUNUIC0+
IEVYVFJBQ1QKICAgICAgcmlzY3Y6IFN0cmVuZ3RoZW4gZHVwbGljYXRlIGFuZCBpbmNvbnNpc3Rl
bnQgZGVmaW5pdGlvbiBvZiBSVl9YKCkKICAgICAgcmlzY3Y6IE1vdmUgYWxsIGR1cGxpY2F0ZSBp
bnNuIHBhcnNpbmcgbWFjcm9zIGludG8gYXNtL2luc24uaAoKIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vaW5zbi5oICAgICAgICAgIHwgMjA2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0t
LQogYXJjaC9yaXNjdi9rZXJuZWwvbWFjaGluZV9rZXhlY19maWxlLmMgfCAgIDIgKy0KIGFyY2gv
cmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyAgIHwgMTQ0ICstLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYyAgICAgICAgICAgICB8ICAgMiArLQog
YXJjaC9yaXNjdi9rdm0vdmNwdV9pbnNuLmMgICAgICAgICAgICAgfCAxMjggKy0tLS0tLS0tLS0t
LS0tLS0tLS0KIDUgZmlsZXMgY2hhbmdlZCwgMTg4IGluc2VydGlvbnMoKyksIDI5NCBkZWxldGlv
bnMoLSkKLS0tCmJhc2UtY29tbWl0OiA3MzFlOTk4YzQyOTk3NGNiMTQxYTA0OWMxMzQ3YTljYWI0
NDRlNDRjCmNoYW5nZS1pZDogMjAyNTA2MjAtZGV2LWFsZXgtaW5zbl9kdXBsaWNhdGVfdjVfbWFu
dWFsLTJjMjMxOTFjMzBmYgoKQmVzdCByZWdhcmRzLAotLSAKQWxleGFuZHJlIEdoaXRpIDxhbGV4
Z2hpdGlAcml2b3NpbmMuY29tPgoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8va3ZtLXJpc2N2Cg==
