Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E421C369D9
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 17:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MmmHEO6d40ArIrWIroCiBpKOGdg7hXQt31X6qlnbl/4=; b=d6iudAUqCeTNLS
	E9XzbogC18fa3tH5pR1nBx7KkmfyJo1AKnBLi5E1jRdvxyRsJ0NNmDTFv00QYeLFLtlYJl1lhzXFw
	Yn23lHFPnjzZXnTPIUiCRaK/Gafw2G4RU1hLJdsyFTiV5cjFWVo7fLtuPzWmjAVPd2CAXRpjeKmPk
	w4fBhgD8v5loaA8jl2WQyVEUk79EeI7mGMTgx2hebHuzhgpvTyblFPo7nXD8SKsGw5NJf/dlenbXe
	c+vwPJq1m53zaxFJQVHAQrR/jWqgOcHY6OJrYWTYX5bzeeHbUY17G8luwZjcQS211ixbj2MpGS+Qu
	dP/6xpjWSy2S4e8jmpbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u807a-0000000Er4S-0kNB;
	Thu, 24 Apr 2025 17:12:22 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7wgq-0000000EBgL-1zre
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 13:32:34 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-3104ddb8051so12526091fa.1
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Apr 2025 06:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745501550; x=1746106350; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VeGcKHqB4Z2wfMv1jlgWPhEkEZUjDKBb+pZQP8ZrwYI=;
        b=U12QJ62dU0yndRKTfYlP9bI0RnU65KtURS3QZsozEv7u8QvHkiF/nS06npbJcPBXRz
         8wdGfiyQMBLtOLlrWm9CBafM2zBVJHAyg+IH5PzKbUr3pEJ7CZ+tVDwwgzoYDtVeAENk
         IeVCBWtFqDj3FA6twAhniWPBzJEQPO6i/vVrJHZFE0S6V2gpdXPnXXsDBAuQbJAbN9xH
         W1dwqq3baSQzjxvqlAY5Pu0btaQ6035rXlAF72/TB5KNcVMIJBVq99aYb1guR+Bx95X6
         iM9v742cpI3WtBaPBh2mExCXffbUPTQ6sTjHajV+7cDePVyLKlMpvpo0+SAfHTihphNP
         HCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745501550; x=1746106350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VeGcKHqB4Z2wfMv1jlgWPhEkEZUjDKBb+pZQP8ZrwYI=;
        b=pSlUuUE2ZZBwKUvscrlWzUpMctTvrVKa4TRHa5xKMHMZWcU0FBjmOdfKHHAPHXUtOv
         jq8ArKSCNpGRhmLq9q6WxYMSpKZCQWLzhDDA2u5HAzEaDafZuGv7i3SHStkUuccyYAjp
         UMK5mCYfEMBpmqXBz1kp5Ua9IEjXmGuKQ0uMA4RolPFkR0m+ms1qR7sH/LmvmJ79/baE
         516esym6szThnm7gyOT6UWddSdCqq+5hdea4ud24VkyFxpclkarao5Wq9wMpdG/A4ZFf
         gazgDsE/QkF2uwifu4MtZ3QJeYA8yy4xzORVZLOeoMfx0FK6t0En+k3T+lXX7gCSFhwZ
         fBHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPJv/a8yzBMsz6LZtExSlKnD3gwZFH//tuqhI+brT0eXV7MJy0L779sr4N/w/GbEmBla/N3yTny5o=@lists.infradead.org
X-Gm-Message-State: AOJu0YwvJG8Txgm62tiynEQZeI5EvJV8eTGDxgn3naMMogCoD8bf0fOc
	U9oLOgmuls0h2jUpIBuEVlE4otMqlQpesuae+jWppJ8sxo5nkrbaGKfF301egNX2QNRzhguJOSd
	2CQ0rKAaAAqnNWb/bWDwFZcTtXbI1mJPrCHOgmg==
X-Gm-Gg: ASbGncvtqUD3z6lqdPYM1Z6GKw9ivRS+zwXMO08JfDCz3/l+tdCkAm59fuTo8C3Nupt
	JBH+EE5/5JNYwRTOptfnF8gwpt9+8EpdeoaZGG2EljH5P5cJQ/JyT9Qu9NF8+13kjeiH47XY0++
	rDP9mt4kQMwzTaIZ/5jQNhZ9o=
X-Google-Smtp-Source: AGHT+IGdkCBJNeEpaCji6/KEonktM17wtjAw8Q/rmHqSi7hrgYLhJ2gPdSQVVvF8FRxWYb7NCMN16LkgY93J/3dhPmc=
X-Received: by 2002:a2e:bc18:0:b0:30b:fe62:2329 with SMTP id
 38308e7fff4ca-3179e5e5184mr10744571fa.11.1745501550226; Thu, 24 Apr 2025
 06:32:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250326065644.73765-1-apatel@ventanamicro.com>
 <20250326065644.73765-11-apatel@ventanamicro.com> <20250412-bc81866c2227ed98429f86b5@orel>
In-Reply-To: <20250412-bc81866c2227ed98429f86b5@orel>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 24 Apr 2025 19:02:18 +0530
X-Gm-Features: ATxdqUGKpSyTYWk5wjcQ2o5qr5UQRJKGGv-UNCsqsaOCMCRFJdyBoxZECeLxDoU
Message-ID: <CAK9=C2UxikXyX_VEn7txnfXVjCdLE7Awn=yjs_Ye2dc8VP=DRg@mail.gmail.com>
Subject: Re: [kvmtool PATCH 10/10] riscv: Allow including extensions in the
 min CPU type using command-line
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Will Deacon <will@kernel.org>, julien.thierry.kdev@gmail.com, maz@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_063232_514989_E0589E11 
X-CRM114-Status: GOOD (  28.00  )
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

T24gU2F0LCBBcHIgMTIsIDIwMjUgYXQgNzoxNeKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBNYXIgMjYsIDIwMjUgYXQgMTI6MjY6
NDRQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+IEl0IGlzIHVzZWZ1bCB0byBhbGxvdyBp
bmNsdWRpbmcgZXh0ZW5zaW9ucyBpbiB0aGUgbWluIENQVSB0eXBlIG9uIG5lZWQKPiA+IGJhc2lz
IHZpYSBjb21tYW5kLWxpbmUuIFRvIGFjaGlldmUgdGhpcywgcGFyc2UgZXh0ZW5zaW9uIG5hbWVz
IGFzIGNvbW1hCj4gPiBzZXBhcmF0ZWQgdmFsdWVzIGFwcGVuZGVkIHRvIHRoZSAibWluIiBDUFUg
dHlwZSB1c2luZyBjb21tYW5kLWxpbmUuCj4gPgo+ID4gRm9yIGV4YW1wbGUsIHRvIGluY2x1ZGUg
U3N0YyBhbmQgU3NhaWEgaW4gdGhlIG1pbiBDUFUgdHlwZSB1c2UKPiA+ICItLWNwdS10eXBlIG1p
bixzc3RjLHNzYWlhIiBjb21tYW5kLWxpbmUgb3B0aW9uLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+ID4gLS0tCj4gPiAgcmlzY3Yv
ZmR0LmMgfCA0MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+
IGRpZmYgLS1naXQgYS9yaXNjdi9mZHQuYyBiL3Jpc2N2L2ZkdC5jCj4gPiBpbmRleCA0YzAxOGM4
Li45Y2VmZDJmIDEwMDY0NAo+ID4gLS0tIGEvcmlzY3YvZmR0LmMKPiA+ICsrKyBiL3Jpc2N2L2Zk
dC5jCj4gPiBAQCAtMTA4LDYgKzEwOCwyMCBAQCBzdGF0aWMgYm9vbCBfX2lzYV9leHRfd2Fybl9k
aXNhYmxlX2ZhaWx1cmUoc3RydWN0IGt2bSAqa3ZtLCBzdHJ1Y3QgaXNhX2V4dF9pbmZvCj4gPiAg
ICAgICByZXR1cm4gdHJ1ZTsKPiA+ICB9Cj4gPgo+ID4gK3N0YXRpYyB2b2lkIF9fbWluX2NwdV9p
bmNsdWRlKGNvbnN0IGNoYXIgKmV4dCwgc2l6ZV90IGV4dF9sZW4pCj4KPiBzL2luY2x1ZGUvZW5h
YmxlLwoKT2theSwgSSB3aWxsIHVwZGF0ZS4KCj4KPiA+ICt7Cj4gPiArICAgICBzdHJ1Y3QgaXNh
X2V4dF9pbmZvICppbmZvOwo+ID4gKyAgICAgdW5zaWduZWQgbG9uZyBpOwo+ID4gKwo+ID4gKyAg
ICAgZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoaXNhX2luZm9fYXJyKTsgaSsrKSB7Cj4gPiAr
ICAgICAgICAgICAgIGluZm8gPSAmaXNhX2luZm9fYXJyW2ldOwo+ID4gKyAgICAgICAgICAgICBp
ZiAoc3RybGVuKGluZm8tPm5hbWUpICE9IGV4dF9sZW4pCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgY29udGludWU7Cj4gPiArICAgICAgICAgICAgIGlmICghc3RybmNtcChleHQsIGluZm8tPm5h
bWUsIGV4dF9sZW4pKQo+Cj4gc3RyY21wIHNob3VsZCBiZSBmaW5lIGhlcmUgc2luY2Ugd2UgYWxy
ZWFkeSBjaGVja2VkIGxlbmd0aC4KCldlbGwsIHN0cmNtcCgpIGRvZXMgbm90IHdvcmsgaGVyZSBi
ZWNhdXNlIHRoZSAiZXh0IiBwb2ludGVyCnBvaW50cyB0byBhIG5vbi1udWxsIHRlcm1pbmF0ZWQg
c3Vic3RyaW5nIG9mIGEgbGFyZ2VyIGNvbW1hCnNlcGFyYXRlZCBzdHJpbmcuCgo+Cj4gPiArICAg
ICAgICAgICAgICAgICAgICAgaW5mby0+bWluX2NwdV9pbmNsdWRlZCA9IHRydWU7Cj4gPiArICAg
ICB9Cj4gPiArfQo+ID4gKwo+ID4gIGJvb2wgcmlzY3ZfX2lzYV9leHRlbnNpb25fZGlzYWJsZWQo
c3RydWN0IGt2bSAqa3ZtLCB1bnNpZ25lZCBsb25nIGlzYV9leHRfaWQpCj4gPiAgewo+ID4gICAg
ICAgc3RydWN0IGlzYV9leHRfaW5mbyAqaW5mbyA9IE5VTEw7Cj4gPiBAQCAtMTI4LDE2ICsxNDIs
MzkgQEAgYm9vbCByaXNjdl9faXNhX2V4dGVuc2lvbl9kaXNhYmxlZChzdHJ1Y3Qga3ZtICprdm0s
IHVuc2lnbmVkIGxvbmcgaXNhX2V4dF9pZCkKPiA+ICBpbnQgcmlzY3ZfX2NwdV90eXBlX3BhcnNl
cihjb25zdCBzdHJ1Y3Qgb3B0aW9uICpvcHQsIGNvbnN0IGNoYXIgKmFyZywgaW50IHVuc2V0KQo+
ID4gIHsKPiA+ICAgICAgIHN0cnVjdCBrdm0gKmt2bSA9IG9wdC0+cHRyOwo+ID4gKyAgICAgY29u
c3QgY2hhciAqc3RyLCAqbnN0cjsKPiA+ICsgICAgIGludCBsZW47Cj4gPgo+ID4gLSAgICAgaWYg
KChzdHJuY21wKGFyZywgIm1pbiIsIDMpICYmIHN0cm5jbXAoYXJnLCAibWF4IiwgMykpIHx8IHN0
cmxlbihhcmcpICE9IDMpCj4gPiArICAgICBpZiAoKHN0cm5jbXAoYXJnLCAibWluIiwgMykgfHwg
c3RybGVuKGFyZykgPCAzKSAmJgo+Cj4gSWYgYXJnID09ICdtaW4nLCB0aGVuIGl0IGNhbid0IGJl
IGxlc3MgdGhhbiAzIHNvIHRoZSAnfHwgc3RybGVuKGFyZykgPCAzJwo+IGlzIGRlYWQgY29kZS4K
Pgo+ID4gKyAgICAgICAgIChzdHJuY21wKGFyZywgIm1heCIsIDMpIHx8IHN0cmxlbihhcmcpICE9
IDMpKQo+Cj4gSSB0aGluayB3ZSB3YW50Cj4KPiAgaWYgKHN0cmxlbihhcmcpIDwgMyB8fAo+ICAg
ICAgKHN0cmxlbihhcmcpID09IDMgJiYgc3RyY21wKGFyZywgIm1pbiIpICYmIHN0cmNtcChhcmcs
ICJtYXgiKSkgfHwKPiAgICAgIHN0cm5jbXAoYXJnLCAibWluIiwgMykpCgpOb3BlLCBmb3IgY3B1
LXR5cGUgPSAibWluIiB0aGUgc3RybGVuKGFyZykgY2FuIGJlIGdyZWF0ZXIgdGhhbiAzCmJlY2F1
c2Ugb2YgY29tbWEgc2VwYXJhdGVkIGV4dGVuc2lvbnMgcHJvdmlkZWQgYXMgcGFydCBvZgpjcHUt
dHlwZSB2YWx1ZS4KCj4KPiA+ICAgICAgICAgICAgICAgZGllKCJJbnZhbGlkIENQVSB0eXBlICVz
XG4iLCBhcmcpOwo+ID4KPiA+ICAgICAgIGlmICghc3RybmNtcChhcmcsICJtYXgiLCAzKSkKPiA+
ICAgICAgICAgICAgICAga3ZtLT5jZmcuYXJjaC5jcHVfdHlwZSA9ICJtYXgiOwo+ID4KPiA+IC0g
ICAgIGlmICghc3RybmNtcChhcmcsICJtaW4iLCAzKSkKPiA+ICsgICAgIGlmICghc3RybmNtcChh
cmcsICJtaW4iLCAzKSkgewo+ID4gICAgICAgICAgICAgICBrdm0tPmNmZy5hcmNoLmNwdV90eXBl
ID0gIm1pbiI7Cj4gPgo+ID4gKyAgICAgICAgICAgICBzdHIgPSBhcmc7Cj4gPiArICAgICAgICAg
ICAgIHN0ciArPSAzOwo+ID4gKyAgICAgICAgICAgICB3aGlsZSAoKnN0cikgewo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIGlmICgqc3RyID09ICcsJykgewo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3RyKys7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250
aW51ZTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICB9Cj4gPiArCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgbnN0ciA9IHN0cmNocihzdHIsICcsJyk7Cj4gPiArICAgICAgICAgICAgICAgICAg
ICAgaWYgKCFuc3RyKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbnN0ciA9IHN0
ciArIHN0cmxlbihzdHIpOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGxlbiA9IG5z
dHIgLSBzdHI7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgaWYgKGxlbikgewo+Cj4gSSB0aGlu
ayBsZW4gd2lsbCBhbHdheXMgYmUgbm9uemVybyBzaW5jZSAqc3RyIGlzbid0IFwwIGFuZCB3ZSBh
dGUgYWxsCj4gY29uc2VjdXRpdmUgLCdzIGFib3ZlLiBfX21pbl9jcHVfaW5jbHVkZSgpIGlzIGFs
c28gc2FmZSB0byBjYWxsIHdpdGgKPiBsZW49MCwgc28gd2UgY291bGQgZHJvcCB0aGlzIGNoZWNr
LgoKTm8gcG9pbnQgaW4gdW5uZWNlc3NhcmlseSBjYWxsaW5nIF9fbWluX2NwdV9pbmNsdWRlKCkg
Zm9yCmxlbiA9PSAwLiBJIGFtIHN1cmUgdGhpcyBleHRyYSBjaGVjayB3b24ndCBodXJ0IHNvIEkg
dGhpbmsKd2Ugc2hvdWxkIGtlZXAgaXQuCgo+Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBfX21pbl9jcHVfaW5jbHVkZShzdHIsIGxlbik7Cj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdHIgKz0gbGVuOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIH0KPiA+ICsg
ICAgICAgICAgICAgfQo+ID4gKyAgICAgfQo+ID4gKwo+ID4gICAgICAgcmV0dXJuIDA7Cj4gPiAg
fQo+ID4KPiA+IC0tCj4gPiAyLjQzLjAKPiA+Cj4KPiBUaGFua3MsCj4gZHJldwoKUmVnYXJkcywK
QW51cAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlz
Y3YK
