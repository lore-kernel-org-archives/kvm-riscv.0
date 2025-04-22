Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03042C369C2
	for <kvm-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 10:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y+B3Jv9OfR6plID1bMLf43lFtD4/gvwNSb+NNSaIDX0=; b=Px2uT1EMS7GHX9
	i2oXiToclvOftipzchPbmkkfRRHzhLCDCOwBoUNyeEdcItycusv3YuvjtsQlugOgMaPFokYeJItY3
	zXiLEaqJuP45lyWeyhhKKWmc1CeYH818CzV13y63ZYguYwElHxx7js4kJKek6rwLDnIXuLaTs50IV
	FyBceaGdv0QkKjd45tYhylod2eZ/EI8AYYBLVWwio5dmOYnT9QuVQTa/KnTn/J1C/jMHcIm23nNCy
	5ikfqS8OTDInmrVNZd2uwAy9F8GSWBbxLE959tQh1Ws5ePidmcieyOyvpgZCDx4lWtuhqtXKL6vH+
	cMTvwpKadgx6/FUHRPlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Ajf-00000006j8F-1qqc;
	Tue, 22 Apr 2025 10:20:15 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79Yv-00000006UVI-03C9
	for kvm-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 09:05:07 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-22c33e5013aso54862475ad.0
        for <kvm-riscv@lists.infradead.org>; Tue, 22 Apr 2025 02:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745312704; x=1745917504; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9sbWhyfY9HhbUloK/aOxoz84ZiMRz1BlzsEwnFKYVZM=;
        b=nEgu+mJJCpnRdjj/56R7Gv7lwcuhP2oOHVXuRcJePq0SwWoqiLzqcEa4jPSdZeShgT
         hK1/jvhVOEnjaTMZEIXTKqLpxZJFRdU2FnQMETPfQIk/+6FsezHYs/7l641B/Uv0S4TU
         ioKFCAMjRR3gK5b/IK77K81Dba00L4aMSP0VoXXsXoVq0C2geZuirA0RPDvjbPecx5ni
         pAcqlzzuUe9YX5lGCpr8qiHaFdmE9gTER6PEysJVZz6P0/H1lAuBYwKno+ngVa8ejVkB
         niJzN0k0o2AUj8iTSOWhfCuEab7ZZL4/Inz+DZj1SgIgxui47KT+rRV8nMz3aenAaT8h
         31Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745312704; x=1745917504;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9sbWhyfY9HhbUloK/aOxoz84ZiMRz1BlzsEwnFKYVZM=;
        b=eMmUHLa5h8jILVlIMxcUZReA1+WQb5OSmfcCudMeYK0t0YuAknUpvBt/FyyNMQyJMJ
         pPAaDIbxClsxhZbSxdQWQqAYObiwLF9/1yp0IyHYpIRrxWvQgTPFBKF1v56Qi9PNEMjB
         EBWHVTGqzHHbjBUguNGhoczJ67w99JVvr/1lGG79f38VA6AmzZlLoeqwOE80fsaFVVnp
         I4OFbi6l9ex5F6hfFWoM9nzIghHRHIePNRaTVk9wuBPwqDz2Oz766nEEUOY4bZPr0Ld9
         WkhgJfCVZUEruoE0DSLseKYb9WrNhxYJVDZRSDnlspSgcoak+fv8unP0FmVH5RdP0L4w
         CXIA==
X-Forwarded-Encrypted: i=1; AJvYcCWVkNi8FCcc159CCaCtHBKsx00DLrWe0WiwsyzokYakKQH7Cljen48QteCUUJIlD1zeR0VUQcHJGtE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwGhGzpLSA2gyPnBmdy+GnIPTFeKynDNlG+5n9vzYnfHeZL4+6R
	IV59NbgFXA9RFYGIUOYQOReHmuR+Dm3hehebtHz9URNLWCLbofCalAiscA8rC6I=
X-Gm-Gg: ASbGncuBpNMjKgf6JxV1ukIsxQpembmsuPl7yudTuItPCXMT00AnSX6GHguxXjI4uL4
	0mFlapYdnHcoVn2VBv6IRbZEmbU/hh1NURx9/jyLLiyyKpwHNXtAOpXnSq/Vj+3fPtg5BgBpOkK
	mwlrPLir1+PU44MYIqPEqcZNjwy8YLZvfnyGm4W/JvyF7Qm0viHGB+hILLJwhe0MUSMzbqpVe7J
	fhk82skZQsGgxufeD+kR5AattQ+TiixdKNlDA4A53MypVXyY+xT+N4UP8P7UTMV4xf3TzqplwIt
	Gwf5kSkQvL+KCLqrLiWDovicIyxltvSjJqeUW6SVOWd+g27EEdJscQTCX7R2n6UCeBmNPxfsmUL
	CPwQM60+lUQ==
X-Google-Smtp-Source: AGHT+IFQAi0wfUdXECfqD6I8bX3VpVnKTNf9yhWhTBL6GpAb8S8NxnHQlFHw5TO7+BUIVct0khX/5A==
X-Received: by 2002:a17:902:db03:b0:223:4c09:20b8 with SMTP id d9443c01a7336-22c5360dc1emr185868245ad.37.1745312704167;
        Tue, 22 Apr 2025 02:05:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bdaad1sm79600495ad.28.2025.04.22.02.04.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 02:05:03 -0700 (PDT)
Message-ID: <db59c652-c4ea-4ed9-abf3-75886924057a@rivosinc.com>
Date: Tue, 22 Apr 2025 11:04:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] riscv: Fix typo EXRACT -> EXTRACT
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
References: <20250422082545.450453-1-alexghiti@rivosinc.com>
 <20250422082545.450453-2-alexghiti@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250422082545.450453-2-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_020505_258081_DB5DF452 
X-CRM114-Status: GOOD (  11.58  )
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

CgpPbiAyMi8wNC8yMDI1IDEwOjI1LCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gU2ltcGx5IGZp
eCBhIHR5cG8uCj4gCj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlA
cml2b3NpbmMuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2luc24uaCB8IDIg
Ky0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMgICAgfCAyICstCj4gIDIgZmlsZXMgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2luc24uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaW5z
bi5oCj4gaW5kZXggMDlmZGU5NWE1ZThmLi4yYTU4OWE1OGIyOTEgMTAwNjQ0Cj4gLS0tIGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9pbnNuLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2luc24uaAo+IEBAIC0zNTIsNyArMzUyLDcgQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSBib29s
IHJpc2N2X2luc25faXNfY19qYWxyKHUzMiBjb2RlKQo+ICAJKHt0eXBlb2YoeCkgeF8gPSAoeCk7
IFJWX1goeF8sIFJWRkRRX0ZMX0ZTX1dJRFRIX09GRiwgXAo+ICAJCQkJICAgUlZGRFFfRkxfRlNf
V0lEVEhfTUFTSyk7IH0pCj4gIAo+IC0jZGVmaW5lIFJWVl9FWFJBQ1RfVkxfVlNfV0lEVEgoeCkg
UlZGRFFfRVhUUkFDVF9GTF9GU19XSURUSCh4KQo+ICsjZGVmaW5lIFJWVl9FWFRSQUNUX1ZMX1ZT
X1dJRFRIKHgpIFJWRkRRX0VYVFJBQ1RfRkxfRlNfV0lEVEgoeCkKPiAgCj4gIC8qCj4gICAqIEdl
dCB0aGUgaW1tZWRpYXRlIGZyb20gYSBKLXR5cGUgaW5zdHJ1Y3Rpb24uCj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMK
PiBpbmRleCAxODRmNzgwYzkzMmQuLjkwMWU2N2FkZjU3NiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jp
c2N2L2tlcm5lbC92ZWN0b3IuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jCj4g
QEAgLTkzLDcgKzkzLDcgQEAgYm9vbCBpbnNuX2lzX3ZlY3Rvcih1MzIgaW5zbl9idWYpCj4gIAkJ
cmV0dXJuIHRydWU7Cj4gIAljYXNlIFJWVl9PUENPREVfVkw6Cj4gIAljYXNlIFJWVl9PUENPREVf
VlM6Cj4gLQkJd2lkdGggPSBSVlZfRVhSQUNUX1ZMX1ZTX1dJRFRIKGluc25fYnVmKTsKPiArCQl3
aWR0aCA9IFJWVl9FWFRSQUNUX1ZMX1ZTX1dJRFRIKGluc25fYnVmKTsKPiAgCQlpZiAod2lkdGgg
PT0gUlZWX1ZMX1ZTX1dJRFRIXzggfHwgd2lkdGggPT0gUlZWX1ZMX1ZTX1dJRFRIXzE2IHx8Cj4g
IAkJICAgIHdpZHRoID09IFJWVl9WTF9WU19XSURUSF8zMiB8fCB3aWR0aCA9PSBSVlZfVkxfVlNf
V0lEVEhfNjQpCj4gIAkJCXJldHVybiB0cnVlOwoKSGkgQWxleCwKCkxvb2tzIGdvb2QgdG8gbWUs
CgpSZXZpZXdlZC1CeTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgoKVGhh
bmtzLAoKQ2zDqW1lbnQKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8va3ZtLXJpc2N2Cg==
