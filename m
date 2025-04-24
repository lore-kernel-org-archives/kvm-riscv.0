Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 081F5C369D8
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 16:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4wc3TMwz2WBPcLL8r8lZFTCo7mN2ZAQ0nGwifHDv6r0=; b=xEfIj1J/JDInSL
	Nqc71zXsv06ujimfHdLHTYDm/I6C62g6lO04qiWOUbl7znoPVo9DtepoHZP2w3tkR1PqDQmYEx1fQ
	UseRjH5Lh0U/OMXhIzMe4k03sTas35cewhmOIZyJ4dt304TWHjom3+kU1hYSoMkIIvDbAmIhU2M23
	OiPvUoY6OyxKRAaUsPVAlZHIui17X6Qmp0qYlYhqv3s30C6H7LV0CBZjjbr/ilnzwmTyrOzEQTrWk
	i7GaUvoWa82CrQinkhR9DdBvh3oJ8tEvRaaUL0VFqJ2ZSdhTwNYDiOiGFZ/qKmGPu2wFM73FkEW+Z
	4eOFSJR8Mgbn8h2ufN5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z6f-0000000EfM7-29nr;
	Thu, 24 Apr 2025 16:07:21 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7yKC-0000000ET8M-3EvF
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 15:17:17 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-54998f865b8so1148329e87.3
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Apr 2025 08:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745507835; x=1746112635; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bkX8L9FmNiooLHGCaRLkArZ3Rbkys/Ef4Mr2QS/rQm4=;
        b=UXmgFzs00qvm4Qf0eOxDr/UFdqcYKnD9OSXQfUabwW7cxiqohk84Y82htum6WUFb0h
         Lh4nVPeY4pmsY8S94Rs061CrC6hZEq8xxWPHjfHO8LMKJ4/Sr/FrUesuJ01josE6bT06
         GIEqYPe+7KkhhWDMzrslLiO4fPuWX0CB7Q3ISKMZtQZ2Zu+tKIXwzvQO+/1pYsE7vFl1
         CMyGsKj7jDGCzcYILkvH7fACoXttfBMPjS+L+TCErWh3i+pBWC23XTIJjQz1Qg8Wgy1X
         +wDRZ/W2TE5jhuR4sX4zJ5ssL2fbt+iXQZumi2Su9zx7a2ti5VuN6Rhq7Z02Mr2oXBL0
         X35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745507835; x=1746112635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bkX8L9FmNiooLHGCaRLkArZ3Rbkys/Ef4Mr2QS/rQm4=;
        b=LAghiKWx6VrCcnuD36hBmYQ6xHGvTtsXybxZ5Bi6aUH383p/FL3zctzGahvttuX2Db
         WLGBajdUTnWmkL8VY94b5E1L0wPGJufBk705cu3PIIkwGA07FBt1ebeHJthWQ5RC1Ig0
         hJYlGJcvzmVIinRKLTZ/20hGEEN864AJaQ6pl6Zg3PEsdcwlhRxx3ZGbpS0fiM9/wUpS
         rNalka9SzPKnP9NJ1c+0rMa9s6nb2a1/26ZzlZyIPZrv43uzS11RYB1r1jGSqDpw/xar
         QinZOlbRfgdwi5mMfHo/+5zp44eC13gYdv06xBPBkwHXMvkkucp1Cb/za5EmWVfzVaI9
         TJIw==
X-Forwarded-Encrypted: i=1; AJvYcCWz7/SBcqi7ddjB4rwwmzFrq6gKD4d4dD+fyy3zQRf1D+dHO4pP0OVg4J5eGpsSxAcsBCz0SZHsMH0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxAg6iLCrTngkcHkoz+hetnxGfwrvxrKPdyRCFkK5r4dkO1GmMr
	IrFcqP0H09FpICOKF7EmjXcc4T0c3EVPABF9lyUIxADPHkl1uvfzfhgTbTi4lobzFSd+nAvNMbD
	bGwZoXMlO5pFXrZDzUqdFLidFtfM/Sx428vNK/w==
X-Gm-Gg: ASbGncv9lfk2gZ4CZyb5uuYg2iyYndVvmVhrQ/IHJigkpolfSPudFf6wy/bJuQYFtu2
	wPdMPZiQZWTgKs+67sw82fZwUHbu9A33v/awpzbIOOy6GcOsqawB3746Y2sK+cHOWUpJkBp8CR+
	UHDhEqAPpTpDyCrakPfxkXXDIrsIOlYbwJsA==
X-Google-Smtp-Source: AGHT+IEq2nDdTYCCuLC8CvG8Nu1G2tLTs9KyL8Oc/Ly8gBV/Sos+3gNM1kuYagtuyh2a1lvS7wE4XaXBUz4iSISWl4U=
X-Received: by 2002:a05:6512:b99:b0:549:6759:3982 with SMTP id
 2adb3069b0e04-54e7c44cc36mr1090314e87.37.1745507834576; Thu, 24 Apr 2025
 08:17:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250326065644.73765-1-apatel@ventanamicro.com>
 <20250326065644.73765-11-apatel@ventanamicro.com> <20250412-bc81866c2227ed98429f86b5@orel>
 <CAK9=C2UxikXyX_VEn7txnfXVjCdLE7Awn=yjs_Ye2dc8VP=DRg@mail.gmail.com> <20250424-153e6b09d5f0ccdee057a0d9@orel>
In-Reply-To: <20250424-153e6b09d5f0ccdee057a0d9@orel>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 24 Apr 2025 20:47:02 +0530
X-Gm-Features: ATxdqUEEIROQU0mWFtLvZ77bUroGqt47muzTW4_uxC9olgu_IqcHhHi2hGHp7K0
Message-ID: <CAK9=C2VCvE34hdTa2h2_Yr78HO-m5fWw-EzM2L9AAgaE9dDs+Q@mail.gmail.com>
Subject: Re: [kvmtool PATCH 10/10] riscv: Allow including extensions in the
 min CPU type using command-line
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Will Deacon <will@kernel.org>, julien.thierry.kdev@gmail.com, maz@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_081716_809532_180BE8DC 
X-CRM114-Status: GOOD (  13.10  )
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

T24gVGh1LCBBcHIgMjQsIDIwMjUgYXQgNzozN+KAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBBcHIgMjQsIDIwMjUgYXQgMDc6MDI6
MThQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+IE9uIFNhdCwgQXByIDEyLCAyMDI1IGF0
IDc6MTXigK9QTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToK
PiA+ID4gPiAgYm9vbCByaXNjdl9faXNhX2V4dGVuc2lvbl9kaXNhYmxlZChzdHJ1Y3Qga3ZtICpr
dm0sIHVuc2lnbmVkIGxvbmcgaXNhX2V4dF9pZCkKPiA+ID4gPiAgewo+ID4gPiA+ICAgICAgIHN0
cnVjdCBpc2FfZXh0X2luZm8gKmluZm8gPSBOVUxMOwo+ID4gPiA+IEBAIC0xMjgsMTYgKzE0Miwz
OSBAQCBib29sIHJpc2N2X19pc2FfZXh0ZW5zaW9uX2Rpc2FibGVkKHN0cnVjdCBrdm0gKmt2bSwg
dW5zaWduZWQgbG9uZyBpc2FfZXh0X2lkKQo+ID4gPiA+ICBpbnQgcmlzY3ZfX2NwdV90eXBlX3Bh
cnNlcihjb25zdCBzdHJ1Y3Qgb3B0aW9uICpvcHQsIGNvbnN0IGNoYXIgKmFyZywgaW50IHVuc2V0
KQo+ID4gPiA+ICB7Cj4gPiA+ID4gICAgICAgc3RydWN0IGt2bSAqa3ZtID0gb3B0LT5wdHI7Cj4g
PiA+ID4gKyAgICAgY29uc3QgY2hhciAqc3RyLCAqbnN0cjsKPiA+ID4gPiArICAgICBpbnQgbGVu
Owo+ID4gPiA+Cj4gPiA+ID4gLSAgICAgaWYgKChzdHJuY21wKGFyZywgIm1pbiIsIDMpICYmIHN0
cm5jbXAoYXJnLCAibWF4IiwgMykpIHx8IHN0cmxlbihhcmcpICE9IDMpCj4gPiA+ID4gKyAgICAg
aWYgKChzdHJuY21wKGFyZywgIm1pbiIsIDMpIHx8IHN0cmxlbihhcmcpIDwgMykgJiYKPiA+ID4K
PiA+ID4gSWYgYXJnID09ICdtaW4nLCB0aGVuIGl0IGNhbid0IGJlIGxlc3MgdGhhbiAzIHNvIHRo
ZSAnfHwgc3RybGVuKGFyZykgPCAzJwo+ID4gPiBpcyBkZWFkIGNvZGUuCj4gPiA+Cj4gPiA+ID4g
KyAgICAgICAgIChzdHJuY21wKGFyZywgIm1heCIsIDMpIHx8IHN0cmxlbihhcmcpICE9IDMpKQo+
ID4gPgo+ID4gPiBJIHRoaW5rIHdlIHdhbnQKPiA+ID4KPiA+ID4gIGlmIChzdHJsZW4oYXJnKSA8
IDMgfHwKPiA+ID4gICAgICAoc3RybGVuKGFyZykgPT0gMyAmJiBzdHJjbXAoYXJnLCAibWluIikg
JiYgc3RyY21wKGFyZywgIm1heCIpKSB8fAo+ID4gPiAgICAgIHN0cm5jbXAoYXJnLCAibWluIiwg
MykpCj4gPgo+ID4gTm9wZSwgZm9yIGNwdS10eXBlID0gIm1pbiIgdGhlIHN0cmxlbihhcmcpIGNh
biBiZSBncmVhdGVyIHRoYW4gMwo+ID4gYmVjYXVzZSBvZiBjb21tYSBzZXBhcmF0ZWQgZXh0ZW5z
aW9ucyBwcm92aWRlZCBhcyBwYXJ0IG9mCj4gPiBjcHUtdHlwZSB2YWx1ZS4KPgo+IFRoYXQncyB3
aGF0IHRoZSBsYXN0IGNvbmRpdGlvbiAnc3RybmNtcChhcmcsICJtaW4iLCAzKScgb2YgbXkgcHJv
cG9zZWQKPiBjb21wb3VuZC1jb25kaXRpb24gaXMgY29uZmlybWluZy4gVGhhdCBjb25kaXRpb24g
aXMgb25seSBjaGVja2VkIGZvcgo+IHN0cmxlbihhcmcpID4gMy4KPgoKVGhpcyBsYXN0IGNvbmRp
dGlvbiBjYXVzZXMgIi0tY3B1LXR5cGUgbWF4IiB0byBmYWlsLgoKUmVnYXJkcywKQW51cAoKLS0g
Cmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
