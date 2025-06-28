Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2639C83000
	for <kvm-riscv@archiver.kernel.org>; Sat, 28 Jun 2025 09:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hHYhzeAhkr6mvK8qXbEcadfgilajuSuO5Na4hkj20vE=; b=P22ge1qV957iWO
	zWlZs84US+No8LW90zbafjcgwoIYw/67QEIdfFXu+q+LXS3GNVXnyyBbN9qZOqWW72sbLKGlLECp7
	fyOBcDWI8OdbWr7fiVWRH4dlzXZsOsL9FTq7pSasmILr3a7uteGXJxPRKaWoza9YgFkFSBDUeNwtO
	oV94utPe4gNutJEB1JY1UQS394oYndDS3Iil99/znP77UH3DxydTSX3X5HfFzhSG8uBclT8VFwFe9
	TXsgt6LmFC7AXy0Jd/ZXfxrKqr4zu/uVjTMl9TABPjJhr/02crcqQ9+mO6cElcHFlNCxQRpFDex7h
	YiMYMlgM6bl5ddkp3Puw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVSHZ-0000000GfLr-0fHF;
	Sat, 28 Jun 2025 09:55:37 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVRay-0000000GbPn-2tkE
	for kvm-riscv@lists.infradead.org;
	Sat, 28 Jun 2025 09:11:37 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a6f2c6715fso664333f8f.1
        for <kvm-riscv@lists.infradead.org>; Sat, 28 Jun 2025 02:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751101895; x=1751706695; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7FcA6TIn+EjFxyCRTXdDsd/VPb9sZm58PfnwqNwHunQ=;
        b=Q1o4YatX766Vp4vjWc96A0RQWc+p2Bh++BeM56Ii102cKk8k4BlM0sm+kU5Jag5a3q
         HgOUwx3Jw+ud4FXeccdMR6/HVJY6ELEbgvmYpGYf43Rblq33Jtj0IPkC8GcnT8+O5Jq1
         yXD5EKoTTf4TdpmgmyB0+CbX06z9C8mCADLtniDXwMCGcNep9Vbu5FaD6cJLTrHqvyY5
         kOFEIe9yrKwq9iS0B+0aSKJEjbwoirVx1AIjeyeNF5Z2Qxy/yY+4n/3HVUh4g3zlwTGS
         GajVzjoxGmKygpDb4/QLfUca6fgWQ75lQlnL629/SDxYbc+FugWKXl8PJLXrkwiD0oZ2
         HQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751101895; x=1751706695;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7FcA6TIn+EjFxyCRTXdDsd/VPb9sZm58PfnwqNwHunQ=;
        b=saRqdKPSsy80bPY/0837kEcTOBqTs8w+6BLp1WPJQW1iDRNvEZpYQqS7d5Yn/PGWpd
         nTpmqH2oZsheQ2Qrhq6XUHfw+PonnktkE+LoRJqwCt883eCTmZtkUO2vIefjtNfXK4mc
         LbBlpdb3XJK2JlNF10pYDwSVOq3CRM9Q4yhgLreNBn8A5x5xYOAD/7fY1faNKo71Y2Qx
         BPIFqcmOC24+rDILDFFQqkjZA0u908AOHM1Mf7Knnlt0wUHrRqRq0gaxGiZlB2PJ6Zw+
         ovCW0ddbit+LZfc8K8gAU2ovZLu1FIpFF0nSrFs3wR/qMv4BINlze65zIaQzm+455m89
         rBng==
X-Forwarded-Encrypted: i=1; AJvYcCXOoV4DmxfXa+77Yhw5I1eYzBc7vQGKOcq8AMpL0+vzvEvOrQWMC+7xDImkFXUF2cdKQ/BYWH8aKoQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxyjK7m0Eu0aHUIeH5bCbnP8cqSMOgs3VsVS0tJWNOsT15EYUCK
	ek8w4V/jeRC8sBQ4EuQYOWW69UaAKdDceBYk2xYzIc/O3qWJ4M1o7m/HzK6+CCXyPoY=
X-Gm-Gg: ASbGncsJGQzmW4x6KOvJvN7o+glEFjXF47OsvmcS42sDsczh0bx8hzL57jb8WMXa5XP
	7xOHk7OfKYcs1SLgzp2zl7GHMoV0/qHM4uaVdKidIQHiaRNkKj7m45g9TsgfJk9ZY5qv7dz2vDl
	t0sGuYZ/m99mLnhVe5LiR2ccrHYP5tTY8Gn8MJmMiGsg6+9GEadhC4xMDctNNS6EwWZ6QguzYwr
	3Tv3c4Kkhx43YvZYJ2mvfe9xNTbYw23Egxg0uvypYn5oPrvNRoO+HTyquHM+ZtOy+4pC2GYKhSE
	DHq9xTGlNhhzbvLms3Sy1/01uI8uNyec3cktOuPQbL864AJnnoOkiKyuJ6u+qM6/NsxViCpyQSD
	SKSe+2ezPkesSg9U=
X-Google-Smtp-Source: AGHT+IEieK15RRdhkv3VLcBWkDEEYiMW0pWKIu4xrmAZJSQy94UpJqgpyFEJrxtpPSx+ZFMLNkTO+w==
X-Received: by 2002:a05:6000:64b:b0:3a6:d5fd:4687 with SMTP id ffacd0b85a97d-3a8f482bd31mr5409951f8f.18.1751101894480;
        Sat, 28 Jun 2025 02:11:34 -0700 (PDT)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e62211sm4876004f8f.99.2025.06.28.02.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 02:11:33 -0700 (PDT)
Date: Sat, 28 Jun 2025 11:11:32 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Jesse Taube <jesse@rivosinc.com>
Cc: Andrew Jones <andrew.jones@linux.dev>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Himanshu Chauhan <hchauhan@ventanamicro.com>, Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v6] riscv: sbi: Add SBI Debug Triggers
 Extension tests
Message-ID: <20250628-c9c23ff68a38206820e40b51@orel>
References: <20250618154452.2136345-1-jesse@rivosinc.com>
 <20250627-c6a984395c94f8281954ab21@orel>
 <CALSpo=bFJyf+Y1w-a7U++Zx_yCH8h6nP7dToAPBGPnYciHbVkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALSpo=bFJyf+Y1w-a7U++Zx_yCH8h6nP7dToAPBGPnYciHbVkQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_021136_747350_EBA6BFB1 
X-CRM114-Status: GOOD (  26.30  )
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

T24gRnJpLCBKdW4gMjcsIDIwMjUgYXQgMTI6MDY6MDJQTSAtMDcwMCwgSmVzc2UgVGF1YmUgd3Jv
dGU6Cj4gT24gRnJpLCBKdW4gMjcsIDIwMjUgYXQgNjowMuKAr0FNIEFuZHJldyBKb25lcyA8YW5k
cmV3LmpvbmVzQGxpbnV4LmRldj4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBKdW4gMTgsIDIwMjUg
YXQgMDg6NDQ6NTJBTSAtMDcwMCwgSmVzc2UgVGF1YmUgd3JvdGU6Ci4uLgo+ID4gPiArICAgICBy
ZXBvcnQoc2htZW0tPmRhdGEudGRhdGExID09IHRkYXRhMSwgInRkYXRhMSBleHBlY3RlZDogMHgl
MDE2bHgiLCB0ZGF0YTEpOwo+ID4gPiArICAgICByZXBvcnRfaW5mbygidGRhdGExIGZvdW5kOiAw
eCUwMTZseCIsIHNobWVtLT5kYXRhLnRkYXRhMSk7Cj4gPiA+ICsgICAgIHJlcG9ydChzaG1lbS0+
ZGF0YS50ZGF0YTIgPT0gKCh1bnNpZ25lZCBsb25nKSZ0ZXN0KSwgInRkYXRhMiBleHBlY3RlZDog
MHglMDE2bHgiLAo+ID4gPiArICAgICAgICAgICAgKHVuc2lnbmVkIGxvbmcpJnRlc3QpOwo+ID4g
PiArICAgICByZXBvcnRfaW5mbygidGRhdGEyIGZvdW5kOiAweCUwMTZseCIsIHNobWVtLT5kYXRh
LnRkYXRhMik7Cj4gPiA+ICsgICAgIHJlcG9ydChzaG1lbS0+ZGF0YS50c3RhdGUgPT0gdHN0YXR1
c19leHBlY3RlZCwgInRzdGF0ZSBleHBlY3RlZDogMHglMDE2bHgiLCB0c3RhdHVzX2V4cGVjdGVk
KTsKPiA+ID4gKyAgICAgcmVwb3J0X2luZm8oInRzdGF0ZSBmb3VuZDogMHglMDE2bHgiLCBzaG1l
bS0+ZGF0YS50c3RhdGUpOwo+ID4KPiA+IFRoZXNlIGRvbid0IG5lZWQgdG8gYmUgc3BsaXQgaW50
byByZXBvcnQvcmVwb3J0X2luZm8gcGFpcnMgYmVjYXVzZSB0aGUKPiA+IHJlcG9ydCBpcyBjaGVj
a2luZyBmb3IgYSBzcGVjaWZpYyB2YWx1ZS4gV2Ugb25seSBzcGxpdCB3aGVuIHJlcG9ydCBpcwo+
ID4gY2hlY2tpbmcgZm9yIHNvbWUgbm9uemVybyB2YWx1ZSBhbmQgd2UgYWxzbyB3YW50IHRvIG91
dHB1dCB3aGF0IHRoYXQKPiA+IHNwZWNpZmljIHZhbHVlIHdhcyBmb3IgaW5mb3JtYXRpb25hbCBw
dXJwb3Nlcy4KPiAKPiBJJ20gYSBiaXQgY29uZnVzZWQuIFNob3VsZCBpdCBvbmx5IHJlcG9ydF9p
bmZvIHdoZW4gdGhlIHRlc3QgZmFpbHM/Cj4gCgpVc3VhbGx5LCBhbmQgdGhhdCdzIHdoYXQgd2Ug
ZG8gaW4gc2JpcmV0X3JlcG9ydCgpLgoKSSBoYXZlbid0IGJlZW4gdmVyeSBnb29kIGF0IGRlc2Ny
aWJpbmcgbXkgaWRlYSBhYm91dCB0aGlzIG5vciByZWFsbHkKaW1wbGVtZW50aW5nIGl0IGNvbnNp
c3RlbnRseSB0aHJvdWdob3V0IHRoZSBmcmFtZXdvcmsuIFRoZSBpZGVhIGlzCnRoYXQgd2hlbiBw
bGF0Zm9ybSBzcGVjaWZpYyBvciBTQkkgaW1wbGVtZW50YXRpb24gc3BlY2lmaWMgdmFsdWVzIGFy
ZQppbnZvbHZlZCB0aGF0IHdlIHNob3VsZCBhdm9pZCBwdXR0aW5nIHRoZW0gaW4gcmVwb3J0KCkg
c3RyaW5ncyBpbiBvcmRlcgp0byBlbnN1cmUgd2UgY2FuIGNhcHR1cmUgb3V0cHV0IGZyb20gYSBz
dWNjZXNzZnVsIHJ1biwgd2hlcmUgSU5GTyBsaW5lcwpoYXZlIGJlZW4gZmlsdGVyZWQgb3V0LCBh
bmQgdGhlbiBzdWJzZXF1ZW50IHJ1bnMgY2FuIGhhdmUgdGhlaXIgZmlsdGVyZWQKb3V0cHV0IGRp
cmVjdGx5IGRpZmZlZCB3aXRoIHRoYXQgb3JpZ2luYWxseSBjYXB0dXJlZCBvdXRwdXQsIGV2ZW4g
aWYgd2UKcnVuIG9uIGFub3RoZXIgcGxhdGZvcm0gLyBTQkkgaW1wbGVtZW50YXRpb24uIEkgZG9u
J3QgdGhpbmsgd2UgY2FuIGFjaGlldmUKdGhhdCByaWdodCBub3csIGJ1dCBJIHRyeSB0byBrZWVw
IGl0IGluIG1pbmQgd2hlbiByZXZpZXdpbmcgdG8gYXZvaWQKbWFraW5nIHRoaW5ncyB3b3JzZS4g
QmVzaWRlcyB0aGUgc2JpcmV0X3JlcG9ydCgpIGFwcHJvYWNoIHdlIGNhbiBhbHNvCmFsd2F5cyBv
dXRwdXQgdmFsdWVzIHdpdGggcmVwb3J0X2luZm8gaWYgdGhhdCBpbmZvcm1hdGlvbiBtYXkgYmUg
dXNlZnVsLAppLmUuCgogIHJlcG9ydChjaGVjayh2YWx1ZSksICJubyB2YWx1ZXMgb3V0cHV0IGhl
cmUiKTsKICByZXBvcnRfaW5mbygidmFsdWUgaXMgJWQiKTsKCm9yLCB3aXRoIGFuIGV4cGVjdGVk
IHZhbHVlIG91dHB1dAoKICBleHBlY3RlZCA9IGdldGVudigiU09NRV9WQVIiKTsKICBpZiAoIXJl
cG9ydCh2YWx1ZSA9PSBleHBlY3RlZCwgInZhbHVlIG1hdGNoZXMgZXhwZWN0YXRpb24gKCVkKSIs
IGV4cGVjdGVkKSkKICAgICByZXBvcnRfaW5mbygidmFsdWUgaXMgJWQiKTsKClRoZSBzZWNvbmQg
YXBwcm9hY2ggd29uJ3QgYWxsb3cgZGlmZmluZyBvdXRwdXQgY2FwdHVyZXMgYXJiaXRyYXJpbHks
IGJ1dApzaG91bGQgc3RpbGwgYWxsb3cgZGlmZmluZyBmb3IgdGFyZ2V0cyB3aXRoIHRoZSBzYW1l
IGNvbmZpZ3VyYXRpb25zLApkZXNjcmliZWQgYnkgdGhlIGVudmlyb25tZW50IHZhcmlhYmxlcywg
YWxsb3dpbmcgdGhlIHJlcG9ydCBsaW5lcyB0bwpjb250YWluIG1vcmUgaW5mb3JtYXRpb24uCgpM
b29raW5nIGF0IHlvdXIgdXNlIGFib3ZlIGFnYWluLCB0aGVuLCBhc3N1bWluZyB0aGUgZXhwZWN0
ZWQgdmFsdWUgaXMKc29tZXRoaW5nIHdlIHdhbnQgdG8gYWx3YXlzIG91dHB1dCwgbGlrZSBpbiB0
aGUgZW52aXJvbm1lbnQgdmFyaWFibGUKZXhhbXBsZSwgSSBndWVzcyB0aGVyZSdzIG5vdGhpbmcg
d3Jvbmcgd2l0aCBpdC4gV2UgY291bGQganVzdCBhdm9pZAp0aGUgaW5mbyBsaW5lcyBvbiBzdWNj
ZXNzIHdpdGggdGhlIGlmICghcmVwb3J0KC4uLiBndWFyZGluZyB0aGVtLgoKLi4uCj4gPiA+ICt2
b2lkIGNoZWNrX2RidHIodm9pZCkKPiA+ID4gK3sKPiA+ID4gKyAgICAgc3RhdGljIHN0cnVjdCBz
YmlfZGJ0cl9zaG1lbV9lbnRyeSBzaG1lbVtSVl9NQVhfVFJJR0dFUlNdID0ge307Cj4gPiA+ICsg
ICAgIHVuc2lnbmVkIGxvbmcgbnVtX3RyaWdzOwo+ID4gPiArICAgICBlbnVtIE1jb250cm9sVHlw
ZSB0cmlnX3R5cGU7Cj4gPiA+ICsgICAgIHN0cnVjdCBzYmlyZXQgcmV0Owo+ID4gPiArCj4gPiA+
ICsgICAgIHJlcG9ydF9wcmVmaXhfcHVzaCgiZGJ0ciIpOwo+ID4gPiArCj4gPiA+ICsgICAgIGlm
ICghc2JpX3Byb2JlKFNCSV9FWFRfREJUUikpIHsKPiA+ID4gKyAgICAgICAgICAgICByZXBvcnRf
c2tpcCgiZXh0ZW5zaW9uIG5vdCBhdmFpbGFibGUiKTsKPiA+ID4gKyAgICAgICAgICAgICByZXBv
cnRfcHJlZml4X3BvcCgpOwo+ID4gPiArICAgICAgICAgICAgIHJldHVybjsKPiA+Cj4gPiBDb3Vs
ZCByZW5hbWUgdGhlICdlcnJvcicgbGFiZWwgdG8gc29tZXRoaW5nIGVsc2UgYW5kIGdvdG8gaXQg
ZnJvbSBoZXJlCj4gPiB0b28uCj4gCj4gSXMgYGR0YnJfZXhpdF90ZXN0YCBvaz8KClN1cmUsIG9y
IGV2ZW4ganVzdCBleGl0X3Rlc3QsIHNpbmNlIHRoaXMgaXMgYSBkYnRyLW9ubHkgZnVuY3Rpb24u
CgpUaGFua3MsCmRyZXcKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8va3ZtLXJpc2N2Cg==
