Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE9DC61CE8
	for <kvm-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 19:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=21kXQGj4Xf8XfSwxko7BlyskkHMRy7Yvb34K+st5dHs=; b=VK4/XOj9Aj0Shp
	Xe/W7kXZiIOM9VQiUIcj0RvMs1KEL/dfgu513dy5Wr8Cu13mkpjVrrOn86ZBIKer0CJpl8szjCayE
	InSgdKD9dI3zx+BEyi/0q+01TUCqdSPXNMmNTejizeSJjD4K30w9JdqtGDJ/yXMlIvSbDJwCAfLOW
	nGVa7xe93fcT5rH0T6I+4cETorjvV/leGryshbFtoMHBSMR/fCTRWTmBsLZqNpWTWYpVjdq3ljopN
	1uklfbdjPMKkBiMvju8FwJEB/oFcfcITvg39ddD/wFsuU8vYz42bKW5LdR1N1+2jmJaO9m9/crXEW
	DmVhqXh9zuxU2QRS8MQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPno8-0000000EFP2-2hCZ;
	Thu, 12 Jun 2025 19:41:52 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhvL-0000000DRfN-07Z7
	for kvm-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 13:24:56 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4a44b0ed780so12690791cf.3
        for <kvm-riscv@lists.infradead.org>; Thu, 12 Jun 2025 06:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1749734693; x=1750339493; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yO42KCFFAU1JaE5snqlMD+WeNGQUfTluFPre84YIRbg=;
        b=uqoHmAYFk50D4bpwPyVO2QLGBRiTjcAK0pxT2LDDU1HjqbfF6O13IUapdacwnh25QB
         nRwDGu7SReX/9aZjABaHw57k90CV6SlmS0pv1bjGksU6h7XR2KMZescWxlwQ5jMzZfC9
         34cW+t+qMCyI5nwZFqJUg9E2oslksI62kSQmzqgnGmxW5Vmh/MnXoB3Q/kz+ipv+qZfA
         4LkcHvZ1Sl0NsphZ4ln5heTZ038ov7w9VMV4f2bZNIvBq/gLgZ8esD65G11WgVJHcwDv
         BrJCax6VSVnIe/0rkbWUGDXxEqThJp5S+FvzT4LoIfQbpDYGctH88vGiwDzoFgplFHpW
         +feA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734693; x=1750339493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yO42KCFFAU1JaE5snqlMD+WeNGQUfTluFPre84YIRbg=;
        b=Ur9+EmmBE5XLDke7yyqcobXigWGsNciCKbd7+8/B0lHIOrEEimS5wtZhfRPMC5uq72
         OyE2FgjI4T000lPGhBu2EHREzaCaMm7jREKVYQxjk+LqFtE1hsF1qUpEJ6xfaDnRG5jW
         YFqt542t4u9aKbnzHO4Y6dXls5LAxpTpReNUf/cdoxqPUFWvBAfNHa7Dc5b6j3tJU1M2
         CsJxgIz49NciUY7RXX0fbLgNRd8l5UNKZG4TZiZ80N8SrI2Uw41u8IXT4mFK3r2a+Ivk
         cpt7Qr+PszQwZxYcOkxLsLeN8mQs3kvxoNj4uKHTNMcqftjdIQll2rbFbIR0rlsuWHlH
         w6vw==
X-Forwarded-Encrypted: i=1; AJvYcCVF8Fd2nTiHGr4TPOiQpy5SUx2JGZWx7dTERR4T44nmPIwDB0qUJLc35jozqIM1Yf9Op3RQGjcrcWo=@lists.infradead.org
X-Gm-Message-State: AOJu0YySw4glQaESs3FdhwtN0zzqWca1ipWG83WiLaNlTDCyOl6A6Xu0
	cm5N5NVY2otqjMZmAAOXFrHBuy2O6cVD+xfq9kuCEKTsUoz700Mufemkaj6ZGvWctrdSEBtoiJj
	OY8dJwumpKJzNf9dKTapp9FBqsMygIow71Xp/UoowPcO6Q4EL5dfW
X-Gm-Gg: ASbGncvnQuB8yTPfikmV7q0n5gldoOWECvlTzm4ODFzJR1LnHKsMV5RVHhKc/wQi9n1
	lPz/WZ1l+3TU09H40+tg7qqyZFraiiGMsNUWxEwRns9Vovh8SdUgalOWYaGPX6JCzmXHTlEALRc
	+ZNKrZJ1f7GkP1Of3wBmy8373expaeo77mB7w5pMUct8pDLiBUcwrARUc=
X-Google-Smtp-Source: AGHT+IEQ8/gBtL0M7nfyYdA1Q09mRUvmfJss0qUxYGME0df67gFne3lBmXn745akWi2zsvhSTtgFKgn2YK7q1n6XKl8=
X-Received: by 2002:a05:6e02:2783:b0:3dd:c40d:787e with SMTP id
 e9e14a558f8ab-3ddfa80be5fmr50613855ab.2.1749734681937; Thu, 12 Jun 2025
 06:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250523101932.1594077-1-cleger@rivosinc.com> <20250523101932.1594077-12-cleger@rivosinc.com>
In-Reply-To: <20250523101932.1594077-12-cleger@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 12 Jun 2025 18:54:30 +0530
X-Gm-Features: AX0GCFu-M1pG9OAlM2fvsx7DbIa0rvE-jQkn0nAnykhBaLvlREw8Qci06BqSqC4
Message-ID: <CAAhSdy10FcQxWR3PCA0502AAEQ7S=TxkX-Jtuh+yVDh5ZgNnSg@mail.gmail.com>
Subject: Re: [PATCH v8 11/14] RISC-V: KVM: add SBI extension init()/deinit() functions
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Deepak Gupta <debug@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_062455_304068_23931CB9 
X-CRM114-Status: GOOD (  21.02  )
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

T24gRnJpLCBNYXkgMjMsIDIwMjUgYXQgMzo1MuKAr1BNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBUaGUgRldGVCBTQkkgZXh0ZW5zaW9uIHdpbGwgbmVl
ZCB0byBkeW5hbWljYWxseSBhbGxvY2F0ZSBtZW1vcnkgYW5kIGRvCj4gaW5pdCB0aW1lIHNwZWNp
ZmljIGluaXRpYWxpemF0aW9uLiBBZGQgYW4gaW5pdC9kZWluaXQgY2FsbGJhY2tzIHRoYXQKPiBh
bGxvd3MgdG8gZG8gc28uCj4KPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdl
ckByaXZvc2luYy5jb20+Cj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRh
bmFtaWNyby5jb20+Cj4gUmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMu
Y29tPgoKUXVldWVkIHRoaXMgcGF0Y2ggZm9yIExpbnV4LTYuMTcKClRoYW5rcywKQW51cAoKPiAt
LS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaCB8ICA5ICsrKysrKysr
Kwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1LmMgICAgICAgICAgICAgICAgIHwgIDIgKysKPiAgYXJj
aC9yaXNjdi9rdm0vdmNwdV9zYmkuYyAgICAgICAgICAgICB8IDI2ICsrKysrKysrKysrKysrKysr
KysrKysrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmggYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oCj4gaW5kZXggNGVkNjIwM2NkZDMwLi5iY2I5MDc1
N2IxNDkgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmku
aAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmgKPiBAQCAtNDks
NiArNDksMTQgQEAgc3RydWN0IGt2bV92Y3B1X3NiaV9leHRlbnNpb24gewo+Cj4gICAgICAgICAv
KiBFeHRlbnNpb24gc3BlY2lmaWMgcHJvYmUgZnVuY3Rpb24gKi8KPiAgICAgICAgIHVuc2lnbmVk
IGxvbmcgKCpwcm9iZSkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKPiArCj4gKyAgICAgICAvKgo+
ICsgICAgICAgICogSW5pdC9kZWluaXQgZnVuY3Rpb24gY2FsbGVkIG9uY2UgZHVyaW5nIFZDUFUg
aW5pdC9kZXN0cm95LiBUaGVzZQo+ICsgICAgICAgICogbWlnaHQgYmUgdXNlIGlmIHRoZSBTQkkg
ZXh0ZW5zaW9ucyBuZWVkIHRvIGFsbG9jYXRlIG9yIGRvIHNwZWNpZmljCj4gKyAgICAgICAgKiBp
bml0IHRpbWUgb25seSBjb25maWd1cmF0aW9uLgo+ICsgICAgICAgICovCj4gKyAgICAgICBpbnQg
KCppbml0KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwo+ICsgICAgICAgdm9pZCAoKmRlaW5pdCko
c3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKPiAgfTsKPgo+ICB2b2lkIGt2bV9yaXNjdl92Y3B1X3Ni
aV9mb3J3YXJkKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9ydW4gKnJ1bik7Cj4g
QEAgLTY5LDYgKzc3LDcgQEAgY29uc3Qgc3RydWN0IGt2bV92Y3B1X3NiaV9leHRlbnNpb24gKmt2
bV92Y3B1X3NiaV9maW5kX2V4dCgKPiAgYm9vbCByaXNjdl92Y3B1X3N1cHBvcnRzX3NiaV9leHQo
c3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBpbnQgaWR4KTsKPiAgaW50IGt2bV9yaXNjdl92Y3B1X3Ni
aV9lY2FsbChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcnVuICpydW4pOwo+ICB2
b2lkIGt2bV9yaXNjdl92Y3B1X3NiaV9pbml0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7Cj4gK3Zv
aWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX2RlaW5pdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwo+Cj4g
IGludCBrdm1fcmlzY3ZfdmNwdV9nZXRfcmVnX3NiaV9zdGEoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
LCB1bnNpZ25lZCBsb25nIHJlZ19udW0sCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1bnNpZ25lZCBsb25nICpyZWdfdmFsKTsKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
dm0vdmNwdS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gaW5kZXggMDI2MzViYWM5MWYxLi4y
MjU5NzE3ZTNiODkgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gKysrIGIv
YXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gQEAgLTE4Nyw2ICsxODcsOCBAQCB2b2lkIGt2bV9hcmNo
X3ZjcHVfcG9zdGNyZWF0ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4KPiAgdm9pZCBrdm1fYXJj
aF92Y3B1X2Rlc3Ryb3koc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICB7Cj4gKyAgICAgICBrdm1f
cmlzY3ZfdmNwdV9zYmlfZGVpbml0KHZjcHUpOwo+ICsKPiAgICAgICAgIC8qIENsZWFudXAgVkNQ
VSBBSUEgY29udGV4dCAqLwo+ICAgICAgICAga3ZtX3Jpc2N2X3ZjcHVfYWlhX2RlaW5pdCh2Y3B1
KTsKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jIGIvYXJjaC9yaXNj
di9rdm0vdmNwdV9zYmkuYwo+IGluZGV4IGQxYzgzYTc3NzM1ZS4uMzEzOWYxNzFjMjBmIDEwMDY0
NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2
bS92Y3B1X3NiaS5jCj4gQEAgLTUwOCw1ICs1MDgsMzEgQEAgdm9pZCBrdm1fcmlzY3ZfdmNwdV9z
YmlfaW5pdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gICAgICAgICAgICAgICAgIHNjb250ZXh0
LT5leHRfc3RhdHVzW2lkeF0gPSBleHQtPmRlZmF1bHRfZGlzYWJsZWQgPwo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBLVk1fUklTQ1ZfU0JJX0VYVF9TVEFUVVNfRElT
QUJMRUQgOgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBLVk1fUklT
Q1ZfU0JJX0VYVF9TVEFUVVNfRU5BQkxFRDsKPiArCj4gKyAgICAgICAgICAgICAgIGlmIChleHQt
PmluaXQgJiYgZXh0LT5pbml0KHZjcHUpICE9IDApCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
c2NvbnRleHQtPmV4dF9zdGF0dXNbaWR4XSA9IEtWTV9SSVNDVl9TQklfRVhUX1NUQVRVU19VTkFW
QUlMQUJMRTsKPiArICAgICAgIH0KPiArfQo+ICsKPiArdm9pZCBrdm1fcmlzY3ZfdmNwdV9zYmlf
ZGVpbml0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiArewo+ICsgICAgICAgc3RydWN0IGt2bV92
Y3B1X3NiaV9jb250ZXh0ICpzY29udGV4dCA9ICZ2Y3B1LT5hcmNoLnNiaV9jb250ZXh0Owo+ICsg
ICAgICAgY29uc3Qgc3RydWN0IGt2bV9yaXNjdl9zYmlfZXh0ZW5zaW9uX2VudHJ5ICplbnRyeTsK
PiArICAgICAgIGNvbnN0IHN0cnVjdCBrdm1fdmNwdV9zYmlfZXh0ZW5zaW9uICpleHQ7Cj4gKyAg
ICAgICBpbnQgaWR4LCBpOwo+ICsKPiArICAgICAgIGZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpF
KHNiaV9leHQpOyBpKyspIHsKPiArICAgICAgICAgICAgICAgZW50cnkgPSAmc2JpX2V4dFtpXTsK
PiArICAgICAgICAgICAgICAgZXh0ID0gZW50cnktPmV4dF9wdHI7Cj4gKyAgICAgICAgICAgICAg
IGlkeCA9IGVudHJ5LT5leHRfaWR4Owo+ICsKPiArICAgICAgICAgICAgICAgaWYgKGlkeCA8IDAg
fHwgaWR4ID49IEFSUkFZX1NJWkUoc2NvbnRleHQtPmV4dF9zdGF0dXMpKQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGNvbnRpbnVlOwo+ICsKPiArICAgICAgICAgICAgICAgaWYgKHNjb250ZXh0
LT5leHRfc3RhdHVzW2lkeF0gPT0gS1ZNX1JJU0NWX1NCSV9FWFRfU1RBVFVTX1VOQVZBSUxBQkxF
IHx8Cj4gKyAgICAgICAgICAgICAgICAgICAhZXh0LT5kZWluaXQpCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgY29udGludWU7Cj4gKwo+ICsgICAgICAgICAgICAgICBleHQtPmRlaW5pdCh2Y3B1
KTsKPiAgICAgICAgIH0KPiAgfQo+IC0tCj4gMi40OS4wCj4KCi0tIAprdm0tcmlzY3YgbWFpbGlu
ZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
