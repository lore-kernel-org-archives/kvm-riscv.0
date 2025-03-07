Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C75C282D0
	for <kvm-riscv@archiver.kernel.org>; Fri,  7 Mar 2025 08:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9qNKGHx1dPP+MO700MCCU4YR3/6DvIUp++i27wAPbeY=; b=MIFy+Q/FioEby7
	nCuGZ33VJrcBl2+UIo6pkjA3eHUDOEzAs0OjOtbcSKMJUmfHPRt3ja1IWKiJRN9gV4ymR46bmnK36
	17hD6wDRrN0UzvYp6TBodQR68OnvdjsJDevcIFIWEHIB4AoETgu1hAB9LbsYWujRRD2jT7po8jGYR
	nGbDT8i/HwHwIF3BIirbU6gVfC2iCWPTD3UlPSwLqAK4QMlkdVEdvrIg+ULSwLC1onzsXIKmL5FJC
	JaPrCVPk+BrAP2eKFjoAM38L/N7WH1EyfTCFGtz3h1vPXsePnWCMqqpFgzpYnq2Hap87q5cWXkLH0
	Bglmq5Jy5R1drpDxwqrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqT4q-0000000DZ9W-1usU;
	Fri, 07 Mar 2025 08:29:04 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqT4m-0000000DZ8Q-3Dkx
	for kvm-riscv@lists.infradead.org;
	Fri, 07 Mar 2025 08:29:02 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3d3db37f4e6so13338805ab.3
        for <kvm-riscv@lists.infradead.org>; Fri, 07 Mar 2025 00:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1741336139; x=1741940939; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8YlIiXhwG4KRcbOBdAmDvGTlkxDSVAhUX3csscpKyVg=;
        b=MPf8/LKuwpYxNqNgjJ5Z3Kxten572YEaqZ5MFmLu9SHNVbKR2uO32N1YsXLmzq4XZx
         o9z/khRKVaG7wibYVEp6ItmI5YwlnwITpo9gKrfRAluo++ojXz4micBYWFddpwTgbeYo
         XekxrL8VYO25isLI57BMl53QYUAUCasBhQSNQOCgzhEKHF2KFkcwrGb5vqWFCeT+pk7B
         ekE9yRP/fNv4oTMu+SmiY97O2vzH6OeeDKToH/mGXOmArQzKjNxlzYH9o7wnnL2fWtLM
         HKMMNY5LyfGqoB82iMTcJjd6H+v6Z90E3wODVrXUObDJuUpy6LZ5JY4a/pifpY+xrXPn
         2O8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741336139; x=1741940939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8YlIiXhwG4KRcbOBdAmDvGTlkxDSVAhUX3csscpKyVg=;
        b=L5cSW6uCHbviI065MAtYEcWnklu7bLuk7apE8fANi069f6xTAltu/M97/GV+lNvThI
         jHC+dPb2wGvyjl6C6eYjackg9M0Mk6F5AxEAUb38XNpteteAEQX5lhhceQMLTPWxTj6F
         zOUvR7pE4MYE4dWSpPu2Gvli2wmgjgTXEC3sbq7cWHu/7SGDZNqD6ZI0kMTGIKojy+LR
         5o3jec3SfE55TAsKZAs5wQbd0RcvhTEyFPdDoMBKh72VLmtna8nYEPvHsHjW2r39Ic3o
         AKCsIKAEXYt6LRAfJbzDooUShr6IK0m0/GBp4v40ke8zUQLRysitS13S5WFx+2C1DKJN
         8iRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTa6GJVczYf37i8QuenV4U2jDYhSCfhf7+wCkRfhf+CeHimN9MR3pqdiow5UQsCldlUWkUP31LVh4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxHPWp4YBAEmPtp0E5/k4F946F7F172daTgJzNaMLFQGM1Ou1RS
	rZGdScYHpTQw18ljyZbKAap/lSsAaXEsHnNjuM7WkPl46Xl+E261FYP/36bWjTretg0+tA22lEF
	fosVp/uUnbBWWOEQOoPLhGyNmztWCyNb/P64BXA==
X-Gm-Gg: ASbGncuAFeSteiTT098BLTex8V9O0MXdr6Z1tFk/L+mpFlSDMyyL6BHym+uNp8Ngxv4
	+/hjyjw0waqFNq9wTEZWxrAjNBCG+r/q31yr3vTzZXDdeQ07iCs/kDGFfCJ1PHnn8gPnxikN1YG
	T7j50ZMR2ZjsZmKfxnhAcwVeFllwc=
X-Google-Smtp-Source: AGHT+IHpyge1YXB1VBykLP/dh9ft8HFAB3zzw6CmKWnhV8/XYcR00xSa4YW+S5Z3jF04shZ9TO0vf5OuS0Vy70VC954=
X-Received: by 2002:a05:6e02:16c7:b0:3d0:239a:c46a with SMTP id
 e9e14a558f8ab-3d44194816cmr30189715ab.9.1741336139186; Fri, 07 Mar 2025
 00:28:59 -0800 (PST)
MIME-Version: 1.0
References: <20250303-kvm_pmu_improve-v2-0-41d177e45929@rivosinc.com>
In-Reply-To: <20250303-kvm_pmu_improve-v2-0-41d177e45929@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 7 Mar 2025 13:58:46 +0530
X-Gm-Features: AQ5f1JqfLRDl2sXghMrs9tGiGCXrhEWfy1IvZjbEz2be6tiJtFVbpcg_wKAhY44
Message-ID: <CAAhSdy3KncYJhPAa20oH=bB1Zi5-=sD8m69OYFS451q3_EMiEA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] RISC-V KVM PMU fix and selftest improvement
To: Atish Patra <atishp@rivosinc.com>
Cc: Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_002901_007251_DA8B13D2 
X-CRM114-Status: GOOD (  12.92  )
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

T24gVHVlLCBNYXIgNCwgMjAyNSBhdCA0OjIz4oCvQU0gQXRpc2ggUGF0cmEgPGF0aXNocEByaXZv
c2luYy5jb20+IHdyb3RlOgo+Cj4gVGhpcyBzZXJpZXMgYWRkcyBhIGZpeCBmb3IgS1ZNIFBNVSBj
b2RlIGFuZCBpbXByb3ZlcyB0aGUgcG11IHNlbGZ0ZXN0Cj4gYnkgYWxsb3dpbmcgZ2VuZXJhdGlu
ZyBwcmVjaXNlIG51bWJlciBvZiBpbnRlcnJ1cHRzLiBJdCBhbHNvIHByb3ZpZGVkCj4gYW5vdGhl
ciBhZGRpdGlvbmFsIG9wdGlvbiB0byB0aGUgb3ZlcmZsb3cgdGVzdCB0aGF0IGFsbG93cyB1c2Vy
IHRvCj4gZ2VuZXJhdGUgY3VzdG9tIG51bWJlciBvZiBMQ09GSSBpbnRlcnJ1cHRzLgo+Cj4gU2ln
bmVkLW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Cj4gLS0tCj4gQ2hh
bmdlcyBpbiB2MjoKPiAtIEluaXRpYWxpemVkIHRoZSBsb2NhbCBvdmVyZmxvdyBpcnEgdmFyaWFi
bGUgdG8gMCBpbmRpY2F0ZSB0aGF0IGl0J3Mgbm90IGEKPiAgIGFsbG93ZWQgdmFsdWUuCj4gLSBN
b3ZlZCB0aGUgaW50cm9kdWN0aW9uIG9mIGFyZ3VtZW50IG9wdGlvbiBgbmAgdG8gdGhlIGxhc3Qg
cGF0Y2guCj4gLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUwMjI2
LWt2bV9wbXVfaW1wcm92ZS12MS0wLTc0YzA1OGMyYmY2ZEByaXZvc2luYy5jb20KPgo+IC0tLQo+
IEF0aXNoIFBhdHJhICg0KToKPiAgICAgICBSSVNDLVY6IEtWTTogRGlzYWJsZSB0aGUga2VybmVs
IHBlcmYgY291bnRlciBkdXJpbmcgY29uZmlndXJlCj4gICAgICAgS1ZNOiByaXNjdjogc2VsZnRl
c3RzOiBEbyBub3Qgc3RhcnQgdGhlIGNvdW50ZXIgaW4gdGhlIG92ZXJmbG93IGhhbmRsZXIKPiAg
ICAgICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6IENoYW5nZSBjb21tYW5kIGxpbmUgb3B0aW9uCj4g
ICAgICAgS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBBbGxvdyBudW1iZXIgb2YgaW50ZXJydXB0cyB0
byBiZSBjb25maWd1cmFibGUKClF1ZXVlZCB0aGlzIHNlcmllcyBmb3IgTGludXgtNi4xNS4KClRo
YW5rcywKQW51cAoKPgo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgMSArCj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9zYmlf
cG11X3Rlc3QuYyB8IDgxICsrKysrKysrKysrKysrKystLS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDU3IGluc2VydGlvbnMoKyksIDI1IGRlbGV0aW9ucygtKQo+IC0tLQo+IGJhc2UtY29tbWl0
OiAwYWQyNTA3ZDVkOTNmMzk2MTlmYzQyMzcyYzM0N2Q2MDA2YjY0MzE5Cj4gY2hhbmdlLWlkOiAy
MDI1MDIyNS1rdm1fcG11X2ltcHJvdmUtZmZmZDAzOGIyNDA0Cj4gLS0KPiBSZWdhcmRzLAo+IEF0
aXNoIHBhdHJhCj4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
a3ZtLXJpc2N2Cg==
