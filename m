Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E75FC79FB6
	for <kvm-riscv@archiver.kernel.org>; Sat, 12 Sep 2026 07:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lt60nUamzZNBX2dHzlNwW2WcHzp3rCLgLZDQT76SvWM=; b=ZN6ZcsW0Wm11Oy
	shiTYlJw0xxVdUrrvIw16Chzy8mvpdFVZtMO+tHo84Vm12ogs6K/dxu/rrdBYqhwd/Nv2qTxXKiGF
	hBZ1VcbuxF79aukzJ6Kc6P5ZkUiYTG8wQO7JWnMSngTZVhCVpm3FbuXsZ4hPQZ4ysU1HViFShDzcf
	N5kMrjep5123aPhk4VA9OvBPkRwbxjPoSFjUDEJnzAC6d0HYtdFU9b2opWLtUdeyFIOWAoLoACKeX
	PpN7pQkBB2IbczSXFLI+kvW4DtAXoj4CV+rF+2pOh2OKA2CeDhV/r+4EW0Am0SydGdUzTsO1z8bFe
	bW8gKZWYIwcMm6XXTvRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5I1i-00000000e46-2r2a;
	Sat, 12 Sep 2026 07:19:54 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5I1g-00000000e38-2MyG
	for kvm-riscv@lists.infradead.org;
	Sat, 12 Sep 2026 07:19:53 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6350f88so138845f8f.2
        for <kvm-riscv@lists.infradead.org>; Sat, 12 Sep 2026 00:19:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789197590; cv=none;
        d=google.com; s=arc-20260327;
        b=GrLl2+Nzl62ddPup/WTsakGRe8W1bpikDTmk4Ixd2vKp56QhwtJfXpY6oTxRMhE7IY
         +8FCzzjurhPKd0BOLkFH8Z+jiltB+dA8XvlpD8GpaEocCDOOPRT3m+OU1VWJ1c019RsV
         4IcHerwYSuvbNG1V2VFBFrdHe1nqxw0Ax8NptP3HZeFRaJHXL7j8vd+81ZsC/0oFcGgt
         o+HXwfpGOGpMdrsoIenX7WnMsLhUb7Pn7MLEzsj4pWCkiLh9+tIeTuTSFaQQl0Tj3R1w
         huKEIefBAbIUWI9Y31MlO7M9NCb5pvy50KfBRHsnv0An7N7ZvS/Empw152rZtKHRqIcX
         O0tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9RWV49ckuigD55nYwZZoBmV/ryAALoCGfcRf1WteUKA=;
        fh=7c4FzH5RR6Y87+FE8AVDBmcHmeVff9yYuvSq78NAOcs=;
        b=nEp205/I3caFus3vc0Os7r23eYApzY06O7N2yIEf1VDLJzbnVniGJmZzObO1WYAIm6
         E8KR6GKhEG8tAA/hqnqsvWCUs4RcySOqttNdqRKQlaByyamRA3b+alLoSQ1MF35n7CEF
         Cwyd0ux+eJ+FVEVnMN+t7yFCqvKvqArKBzu3e4PWDEsD52ufV1tzdH0bKhv5OSUQRIUq
         B5xhl0Xp+J3hGsOuiOPdKMRXVAUQbgO9zkJ30WKXtLhPyHlDEkrW5KmEUcOuyi8lj7ux
         IsjqGyKMeL+4wamGSwAQCjA2ntMph145msgasO/ssZEYgGuPTsC7Gr27MVu5xIFWhe9h
         wP1w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789197590; x=1789802390; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9RWV49ckuigD55nYwZZoBmV/ryAALoCGfcRf1WteUKA=;
        b=oFMg8gseVHRNRBfhsZG9AwoR40r4Qpvv0wGzzpLXts3iBDYUOu+X6G3DykQ2P+Zt1l
         xXhjjFNINbVcZmqodnsjoT7E2Mz6Kph8TBOf25a+6L1D8OpmaqBv79mDlWbg69l8KPjo
         GJGhDwE7lAThT4S1yAXTRGvgk89439c+H1zbFQaLVq4CHLMCSFtocfOUQRFX5IcFoSUS
         BrvFtyomHBht4/8u8BtLyY+ITiLERtJ/vyNoq7oE1qrJ7+G+KtBSqEikYVh3K8C9O8pf
         vhivMPHMcgZjSWJPwITkz6etdfXDFw5wsNw/UIBMX/9GmW09rg/XVtAj7HQzFHEbXozY
         3rVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789197590; x=1789802390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9RWV49ckuigD55nYwZZoBmV/ryAALoCGfcRf1WteUKA=;
        b=INaJAJfZVqXSf77V4AqnXu6dVbd4Ir21CiqTLKJ6dIjHMrDmyJNODptkMCzEEDVdmu
         kPRVtDLHB/Xnv2qCYuL+Z6B7PuzOAVJieT9qpJyqvv4IwxgdGDLHEBqA+BszZxBF2/DN
         WD/T0fbfzn6L/yvSMIqXiHVumo/ELqEgWG3gfGULSxk3ALF2zTrvUyzbM+b0zam5uzA8
         a1AGis7imm5RfqZdHBO3mI2GiU1HyaD6S9zvqMKZdNoaDAe0/yznefMV7PFIL9BHQxLc
         tDWxLPI3+3mE8mg26l1kh8yd5pOXWBAKjjhNw6N0tbvjra6SCBodQyoQs7wtaF/ylB71
         os4w==
X-Forwarded-Encrypted: i=1; AKwUvBx+mlK6QhopbCdB5MIBpNlrs6qP5vE2atUX9+Yvm3L5mpKb6W7QJkn+9sOAW4VfHc7k1qSXBYRvlPA=@lists.infradead.org
X-Gm-Message-State: AFuF++nW2f3oKhnTaOHYQtiPRfM9n5m+kK0ZYnHqb4mq6aFXwQUrnVPp
	a9wrd5LrxR/JMfEdf0DVxiLscgmpPC2V6F/jj3tXWJDtNJ72bljKMvKUSn0DKE8FQh9+qC/3c+u
	zTxnONQ3+M6tMpo3h8zW55m+6ZogX5F+lzDm7wz6ETQ==
X-Gm-Gg: AYBFou0XRQ3wPFACm2+oeMXYgv7VTPI+pUBZzrBiY5H+yp2vw+LUZjWC+tcF3zIcE9n
	md5tk96t+Ag5bfeOxaZ3gUBCXoZfmfeiBRKMlAQWFjOA8zv5uJAP5l40wnjLAhEbmYeV0imdiOx
	2KyhQ1v0Ms1kwaXzFOCdlxT35D4WUq6KovN3noD4kS98F4RLGXQT1h6guqT3yNDSoL7kO0RhYv4
	agKVrIxHuNP+dUiNndH63SU0K837zb/3eUmnD26zumT9N/GEdfiX1HMGWBUI+uhJZ3YBumqOt6a
	J110SuPSMhE6+u5Flngyt68JmEXaf5bOoy+7m/wOqM0aVrDCDhGvqNbKtS9kzzJ14GGxBN73PmV
	ggvSqpoQgl4T1snrkNGFoPvoP7nnTkLpkH7epIa59lmyg1OV5renpXTss6qH97Sc9k73CKIk+K1
	M=
X-Received: by 2002:a05:6000:702:b0:486:f600:8e6b with SMTP id
 ffacd0b85a97d-486f6be9493mr1750445f8f.14.1789197589863; Sat, 12 Sep 2026
 00:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260826064117.58029-1-min_halo@163.com>
In-Reply-To: <20260826064117.58029-1-min_halo@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 12 Sep 2026 12:49:37 +0530
X-Gm-Features: AcwNN1WADS_UyMRbl-o6HEs2JIz2PBNtpUz7lA9SsGRbmoy5E-S50JL4uCJxHNQ
Message-ID: <CAAhSdy1AugX4AiU6xj1R3SQ9bRsRFBNu6=_aYM=G9SMkXN8Ghg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix sdata leak and stale snapshot_addr in snapshot_set_shmem
To: Zongmin Zhou <min_halo@163.com>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, ajones@ventanamicro.com, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Zongmin Zhou <zhouzongmin@kylinos.cn>, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_001952_624367_8CAE144C 
X-CRM114-Status: GOOD (  19.50  )
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

T24gV2VkLCBBdWcgMjYsIDIwMjYgYXQgMTI6MTHigK9QTSBab25nbWluIFpob3UgPG1pbl9oYWxv
QDE2My5jb20+IHdyb3RlOgo+Cj4gRnJvbTogWm9uZ21pbiBaaG91IDx6aG91em9uZ21pbkBreWxp
bm9zLmNuPgo+Cj4gQSBndWVzdCBtYXkgY2FsbCBTQklfUE1VX1NOQVBTSE9UX1NFVF9TSE1FTSBy
ZXBlYXRlZGx5LiBFYWNoIGNhbGwKPiBvdmVyd3JpdGVzIGt2cG11LT5zZGF0YSB3aXRob3V0IGZy
ZWVpbmcgdGhlIG9sZCBidWZmZXIgKG1lbW9yeSBsZWFrKSwKPiBhbmQgaWYgYSBsYXRlciBrdm1f
dmNwdV93cml0ZV9ndWVzdCgpIGZhaWxzLCB0aGUgZXJyb3IgcGF0aCBmcmVlcwo+IHNkYXRhIGJ1
dCBsZWF2ZXMgc25hcHNob3RfYWRkciBzdGFsZS4gQSBzdWJzZXF1ZW50Cj4gU0JJX1BNVV9DT1VO
VEVSX1NUQVJUIHRoZW4gcGFzc2VzIHRoZSBJTlZBTElEX0dQQSBjaGVjayBhbmQgY3Jhc2hlcwo+
IHRoZSBob3N0IHdpdGggYSBOVUxMIGJ1ZmZlciBpbiBrdm1fdmNwdV9yZWFkX2d1ZXN0KCkuCj4K
PiBGaXggdGhpcyBieSBjbGVhcmluZyB0aGUgcHJldmlvdXNseSBpbnN0YWxsZWQgc25hcHNob3Qg
YXJlYSBiZWZvcmUKPiBpbnN0YWxsaW5nIGEgbmV3IG9uZSwgd2hpY2gga2VlcHMgc2RhdGEgYW5k
IHNuYXBzaG90X2FkZHIgY29uc2lzdGVudC4KPiBUaGUgU0JJIHNwZWMgc3VnZ2VzdHMgYSBzaW5n
bGUgaW52b2NhdGlvbiBidXQgZGVmaW5lcyBubyBlcnJvciBjb2RlCj4gZm9yIHJlcGVhdGVkIGNh
bGxzLCBzbyBLVk0gbXVzdCB0b2xlcmF0ZSB0aGVtLgo+Cj4gRml4ZXM6IGMyZjQxZGRiY2RkNzU2
ICgiUklTQy1WOiBLVk06IEltcGxlbWVudCBTQkkgUE1VIFNuYXBzaG90IGZlYXR1cmUiKQo+IENj
OiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogWm9uZ21pbiBaaG91IDx6
aG91em9uZ21pbkBreWxpbm9zLmNuPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxh
bnVwQGJyYWluZmF1bHQub3JnPgoKUXVldWVkIHRoaXMgcGF0Y2ggYXMgZml4IGZvciBMaW51eC03
LjMtcmNYCgpUaGFua3MsCkFudXAKCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5j
IHwgOCArKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVf
cG11LmMKPiBpbmRleCA3NTJmMTAxNGQ2MzNlN2Q2N2Y2OWMyN2I3MjA4OGVkNTYwYzE4N2FjLi4x
NGY3MzQ5MGYxMmNiYzVhODU0Nzg1OWYwZDFiYjExNzBkODk0MDNiIDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5j
Cj4gQEAgLTQ1NCw2ICs0NTQsMTQgQEAgaW50IGt2bV9yaXNjdl92Y3B1X3BtdV9zbmFwc2hvdF9z
ZXRfc2htZW0oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIHMKPiAgICAgICAg
ICAgICAgICAgfQo+ICAgICAgICAgfQo+Cj4gKyAgICAgICAvKgo+ICsgICAgICAgICogQ2xlYXIg
YW55IHByZXZpb3VzbHkgaW5zdGFsbGVkIHNuYXBzaG90IGFyZWEgdG8gYXZvaWQgbGVha2luZwo+
ICsgICAgICAgICogdGhlIG9sZCBzZGF0YSBhbmQgdG8ga2VlcCBzZGF0YS9zbmFwc2hvdF9hZGRy
IGNvbnNpc3RlbnQgaWYKPiArICAgICAgICAqIHRoZSByZS1pbnN0YWxsIGZhaWxzIGJlbG93Lgo+
ICsgICAgICAgICovCj4gKyAgICAgICBpZiAoa3ZwbXUtPnNuYXBzaG90X2FkZHIgIT0gSU5WQUxJ
RF9HUEEpCj4gKyAgICAgICAgICAgICAgIGt2bV9wbXVfY2xlYXJfc25hcHNob3RfYXJlYSh2Y3B1
KTsKPiArCj4gICAgICAgICBrdnBtdS0+c2RhdGEgPSBremFsbG9jKHNuYXBzaG90X2FyZWFfc2l6
ZSwgR0ZQX0FUT01JQyB8IF9fR0ZQX0FDQ09VTlQpOwo+ICAgICAgICAgaWYgKCFrdnBtdS0+c2Rh
dGEpIHsKPiAgICAgICAgICAgICAgICAgc2JpcmV0ID0gU0JJX0VSUl9GQUlMVVJFOwo+IC0tCj4g
Mi4zNC4xCj4KPgo+IE5vIHZpcnVzIGZvdW5kCj4gICAgICAgICAgICAgICAgIENoZWNrZWQgYnkg
SGlsbHN0b25lIE5ldHdvcmsgQW50aVZpcnVzCj4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0
Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
