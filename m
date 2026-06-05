Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00E9CD6E7D
	for <kvm-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 14:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xlOBpTn8f6lvbq2tCOFlshy+Z5tnr5o9qxUulYT9jJs=; b=IpVquE7b2FD96s
	T3QDTwUr+5QmhtIA98HHSkA5u5KDfNWGp4YehYYrwsU6Pyg7oJ1/2Q2FH8KPpyx7IFs/fOTOhVnZ6
	G+gLsFkHfvqMUS22lAZ68JTLcDt85yU/LovMrieqYOVSCDrdV+HAh56HrfblFxPlxg7jz6FVZ9uyJ
	UzQrMnSPMZdx6QwKLA5X07ZnHWQHLW1s5nRXApPX91uMfeNzhTbZaMQ20R+M8J0JrglTiKvoUX5iu
	VszfjY5nnWpWBkplJRHt0Mxk5Po4YaRY88vvjFySrZJaBy+O5hASXdn6MVmgtAPRTIWgNRn++f9sf
	fxkZ4nohxr35gwr0CKCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVVwW-00000000kwE-0xLD;
	Fri, 05 Jun 2026 14:54:40 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVVwS-00000000kur-2gYV
	for kvm-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 14:54:39 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-5174a3d9598so17989441cf.3
        for <kvm-riscv@lists.infradead.org>; Fri, 05 Jun 2026 07:54:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780671275; cv=none;
        d=google.com; s=arc-20240605;
        b=eelj7q4c+W9UG98/XhXmnC2+a0PIYSqbPhvGyoHpjmjkfxRkMXW0IRvuSpOND4/2+N
         05mblRL/zoJiQQnaOixP+piGU28633xLgkhIQi2GSAq70uk3KqwUCqQ6WxkK5EuffxQS
         QWut2PiQXA9zNsc7HfSFDwdY2wSS3PcqxADds15N3j08rYEvtDtMOMd5uzY+91K2EfAb
         GX5k2jqLzqlF8h+ob4J7cFhPZuhX/VagEhEF04vy22+OZdZFLQOkEtTPpmxgOuvMtqvq
         Da67Q0bteBIaeuAFI8gzPXCXodVxc3yaepMzzyC6ZwLPHfF9rG+T2LP3Aca3rgrIe37R
         XyCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QjX98Uht19FjoE2NcL+rrjlJpfTyguEM6t6ATWltAqU=;
        fh=5n7JWaxMgPAGnDeZ9q4eBEUyQfA1jTHaailGX0euzV8=;
        b=QTQaDaYrgmuFwCk3p1vwVRU6ftgAm78MQmjk/CJqp+EsjbuKEBDnyKtUwZL4C2Ezcz
         Kx7QNAqpcewxMMQR9wzQhBWSlf85cFcPRXTUnJETyz290LqzKVsr69/lreHK+Pu6Igys
         QHbWDN7LWAs21IfQ6FCWag80CfSqqxzIWOys9Hixwt6jPE7YUgqunEDWwdJEotZXXUgQ
         6drINKMmxdA4LU2hbuxFpxJh2VggTqqHjSluHOh7b3odLtKyyg2WXWymCCnFmdnvRRmJ
         2gtFM898BYDrnQRbfu6QHVbJlpnAHsiy5YOUy3dXaiShmkEQYZ5FdxCrjYerwNow5D6W
         rbeg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780671275; x=1781276075; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjX98Uht19FjoE2NcL+rrjlJpfTyguEM6t6ATWltAqU=;
        b=gHpXelhXjWTaKxMdF4SwiGMFzkOkhWEyUYdr4Cx4Q8MU4wZQYZl2USdbqn4Pf0HlQM
         2OGScdHM0tAafAcSD72pi+vZPyC307H0TlkvowMN7DYkfz+OJgB8mRKy/fP+lODlV6fw
         gWRz/HLijh+nY0AN0v9nHLcV9EEIZ1dRiH35c87b7qAIXY1uPd2JYyJb6MKD4UPmfGL3
         Y9OlDdarfVjC7u0UZxLwgmwLclGTTCa+zgWkwQqenDjqY+VsyUp6iMasYZiWvmNgchqe
         ZOWmqLwfChxEJYZaFi0kdLT/UxxdVgUCKV4HIG1OQsv/X3JeKaNt/ILIjqdEzoqeYdlh
         JW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780671275; x=1781276075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QjX98Uht19FjoE2NcL+rrjlJpfTyguEM6t6ATWltAqU=;
        b=J9PHebC64pyC095PUSzt1a04BmqltjAZyI17eq1TtxDNTopxK5kLb9qj9vaanwuNM7
         olzfO9rmQcjG9ev+vPXhZ8zMVIALh5sXSzqMW2NaaWKCUNa2YvAYzK614wZeoiRs1vLA
         bRsY3iNllaigU4NcaBIjjXozbnliG3Ab2rF2EuHtuk+ZVXi8jx13kbHTjoGPG+StHqFU
         dwUEd1V8YDDxClMZV0Z/mlHMAJO4OViY0+mXfCehFhGpLtNyvYr2/PqrGKTnduuXY37N
         xq8ICWZyfs1jfxCXtXb6gFBAxdabKaAFnPjh49rOeIO3ln9JehenMwdaM+7T0zaVMV2G
         RZGA==
X-Forwarded-Encrypted: i=1; AFNElJ+DX8UD1dtcrlCj2m78XmnSMSjdXd9QYF96eD7NZCe6R2sa0f9UhKsE2H6XGzozTjYqJMXlTOD15MQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyDkDYV1xDaabwkS9rVIYCRPeQtn5B8WwBqoPyZJKscoXnU1g31
	8+zvVVee0SyhbQV3Qw1HDDVF0v5NYo6JiEeasbfjTC8YBKOnbiXd+p4U+QMh6roDbQyXU1k2j0A
	l4WfS6avFHaApgq2d26ILLux7pFhW9z+mW1HIP4sDvA==
X-Gm-Gg: Acq92OGcNgcL5OclDrSJAT5FXt2+KMibpxEA1LBlDc9pJi37vLnnSli398KAVbrndnB
	vPPsEixn4ZUKF9gLDU9y9cVR1w+S9xZBWvI7TwWltvQs/TSu8yy0sG8/B3/0ns+ItnKek4qaBFT
	dF99LwGRberAZNFbBTDREjCQdlLbI5GTvpDaz1Sz5laPBhu/BRGVTVPGDo/q2PT7AjiveXsn44V
	C7yFWjPqchMpDblXq8MeaPlf60ZTMSDzP2cUe62J5/iX16PkynVKgAXyVIo4AsyC6MF7D3WqcG1
	22eur/2dy5bOj9gFkOtGfP414ovZllf2yQS/NniZPghCqTu6IGK6sH7ZOiiDRDudFT1BzNvYfg9
	W475tofdOOJcSj4AIB5sWVeduY6XvD4UVMC3Sgw==
X-Received: by 2002:ac8:41cc:0:b0:517:9648:f71f with SMTP id
 d75a77b69052e-5179648fc59mr42366971cf.45.1780671275119; Fri, 05 Jun 2026
 07:54:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260528113840.2629186-1-inochiama@gmail.com>
In-Reply-To: <20260528113840.2629186-1-inochiama@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 5 Jun 2026 20:24:21 +0530
X-Gm-Features: AVHnY4KB369R15pBBirZiowSu3UvfNZTrfqaGWoeJbgD61ZJLwhslkozizsMbN0
Message-ID: <CAAhSdy1svqDsgNSMhawR4xJN0=LLpRv2dkTu54oc9S7BmqfVzg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Enhance the logging check for mmu mapping
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_075436_936301_7E96ADC4 
X-CRM114-Status: GOOD (  20.45  )
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

T24gVGh1LCBNYXkgMjgsIDIwMjYgYXQgNTowOOKAr1BNIElub2NoaSBBbWFvdG8gPGlub2NoaWFt
YUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gV2hlbiBlbmFibGluZyBkaXJ0eSByaW5nLCB0aGUgZGly
dHkgYml0bWFwIGlzIGRpc2FibGUsIGFuZCB0aGUgbG9nZ2luZwo+IGNoZWNrIGlzIGFsd2F5cyBm
YWxzZSBhcyB0aGUgUklTQy1WIGFyY2hpdGVjdHVyZSBkb2VzIG5vdCBzZWxlY3QKPiAiTkVFRF9L
Vk1fRElSVFlfUklOR19XSVRIX0JJVE1BUCIuIEFsdGhvdWdoIHRoZSBkaXJ0eSBsb2cgaXMgcmVj
b3JkZWQKPiBzaW5jZSB0aGUgd3JpdGUgcGF0aCBhbHJlYWR5IHRyeWluZyB0byBhZGQgdGhlIGRp
cnR5IGxvZywgdGhlIGxvZ2ljIGZvcgo+IGxvZ2dpbmcgY2hlY2sgaXMgYnJva2VuIGFuZCBzb21l
IHNpZGUgZWZmZWN0IHdpbGwgb2NjdXJzLgo+Cj4gRW5oYW5jZSB0aGUgbG9nZ2luZyBjaGVjayBm
b3IgbW11IG1hcHBpbmcgc28gaXQgY2FuIGNoZWNrIGJvdGggdGhlIGRpcnR5Cj4gcmluZyBhbmQg
dGhlIGRpcnR5IGJpdG1hcC4KPgo+IFNpZ25lZC1vZmYtYnk6IElub2NoaSBBbWFvdG8gPGlub2No
aWFtYUBnbWFpbC5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJh
aW5mYXVsdC5vcmc+CgpRdWV1ZWQgdGhpcyBwYXRjaCBmb3IgTGludXgtNy4yCgpUaGFua3MsCkFu
dXAKCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL21tdS5jIHwgOSArKysrLS0tLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2t2bS9tbXUuYyBiL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gaW5kZXggMmQz
ZGVmMDI0MjcwLi5iNTg3M2JjYTlkY2UgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vbW11
LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+IEBAIC0xNDIsOSArMTQyLDggQEAgdm9p
ZCBrdm1fYXJjaF9jb21taXRfbWVtb3J5X3JlZ2lvbihzdHJ1Y3Qga3ZtICprdm0sCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBlbnVtIGt2bV9tcl9jaGFuZ2UgY2hhbmdlKQo+ICB7
Cj4gICAgICAgICAvKgo+IC0gICAgICAgICogQXQgdGhpcyBwb2ludCBtZW1zbG90IGhhcyBiZWVu
IGNvbW1pdHRlZCBhbmQgdGhlcmUgaXMgYW4KPiAtICAgICAgICAqIGFsbG9jYXRlZCBkaXJ0eV9i
aXRtYXBbXSwgZGlydHkgcGFnZXMgd2lsbCBiZSB0cmFja2VkIHdoaWxlCj4gLSAgICAgICAgKiB0
aGUgbWVtb3J5IHNsb3QgaXMgd3JpdGUgcHJvdGVjdGVkLgo+ICsgICAgICAgICogQXQgdGhpcyBw
b2ludCBtZW1zbG90IGhhcyBiZWVuIGNvbW1pdHRlZCBhbmQgZGlydHkgcGFnZXMgd2lsbCBiZQo+
ICsgICAgICAgICogdHJhY2tlZCB3aGlsZSB0aGUgbWVtb3J5IHNsb3QgaXMgd3JpdGUgcHJvdGVj
dGVkLgo+ICAgICAgICAgICovCj4gICAgICAgICBpZiAoY2hhbmdlICE9IEtWTV9NUl9ERUxFVEUg
JiYgbmV3LT5mbGFncyAmIEtWTV9NRU1fTE9HX0RJUlRZX1BBR0VTKSB7Cj4gICAgICAgICAgICAg
ICAgIGlmIChrdm1fZGlydHlfbG9nX21hbnVhbF9wcm90ZWN0X2FuZF9pbml0X3NldChrdm0pKQo+
IEBAIC00MzMsOCArNDMyLDggQEAgaW50IGt2bV9yaXNjdl9tbXVfbWFwKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSwgc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqbWVtc2xvdCwKPiAgICAgICAgIHN0cnVj
dCB2bV9hcmVhX3N0cnVjdCAqdm1hOwo+ICAgICAgICAgc3RydWN0IGt2bSAqa3ZtID0gdmNwdS0+
a3ZtOwo+ICAgICAgICAgc3RydWN0IGt2bV9tbXVfbWVtb3J5X2NhY2hlICpwY2FjaGUgPSAmdmNw
dS0+YXJjaC5tbXVfcGFnZV9jYWNoZTsKPiAtICAgICAgIGJvb2wgbG9nZ2luZyA9IChtZW1zbG90
LT5kaXJ0eV9iaXRtYXAgJiYKPiAtICAgICAgICAgICAgICAgICAgICAgICAhKG1lbXNsb3QtPmZs
YWdzICYgS1ZNX01FTV9SRUFET05MWSkpID8gdHJ1ZSA6IGZhbHNlOwo+ICsgICAgICAgYm9vbCBs
b2dnaW5nID0ga3ZtX3Nsb3RfZGlydHlfdHJhY2tfZW5hYmxlZChtZW1zbG90KSAmJgo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIShtZW1zbG90LT5mbGFncyAmIEtWTV9NRU1fUkVBRE9OTFkpOwo+
ICAgICAgICAgdW5zaWduZWQgbG9uZyB2bWFfcGFnZXNpemUsIG1tdV9zZXE7Cj4gICAgICAgICBz
dHJ1Y3Qga3ZtX2dzdGFnZSBnc3RhZ2U7Cj4gICAgICAgICBzdHJ1Y3QgcGFnZSAqcGFnZTsKPiAt
LQo+IDIuNTQuMAo+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2t2bS1yaXNjdgo=
