Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0F0CD8C88
	for <kvm-riscv@archiver.kernel.org>; Sun,  7 Jun 2026 06:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CiMw67Z1qVPBWB09fLq/7T0ubU5VY/ZSOycRx54MU6w=; b=T1/hkj60LUbXPH
	xuP4EPpCMzy7esOIvzfziO/sbP3+Y2zc0d5tPHmwM3mc20xgo7wxtfAZ3nhj0cvnlLYZ+n6MSqZ6f
	5tK0WT4QPvStoGxl0fLewrseIXuh/mv8sc5waiVnKLMKm6TjEVNl9XbcSTbHixHO2el7KIVLOpkI1
	2HjJlp/BuxvUhd37m/RnwM/I/+TfxNS0R/H+S1Ate4v5rL+sMqosQYqTa2Avzn1RYkxhwACxALsTH
	pKHw1wu9af4Z22VLjYOMEgD3xCwA7fCNmJU/+YmS57mY7TXgA5higbtU8x6fHFF8/8sYaUIDyC2A+
	tnLcLx+BXOAwBKF92EWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW6sM-0000000248H-3ATR;
	Sun, 07 Jun 2026 06:20:50 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW6sK-00000002475-1nez
	for kvm-riscv@lists.infradead.org;
	Sun, 07 Jun 2026 06:20:49 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7e6f27619e7so2644311a34.2
        for <kvm-riscv@lists.infradead.org>; Sat, 06 Jun 2026 23:20:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780813247; cv=none;
        d=google.com; s=arc-20240605;
        b=aExzBJN2byXw2YQhW8er1VeoSDgYZyxx1lpzq2ydUz+cY5GO79j+757/EAzuKP4Go1
         K6/hCbp/h6PFr9MQIWBRvol+0lukA6uROQWryxJARl1x17ESavwne5yuOHTh+B78pZQz
         xU5C6KrUns2PZ8apAd/dJjwLjSzxt6husLZVBie8IsD+v2ivHIUIZQyKdEYoEpu6UA58
         RJ1uNuszxdiCqhOxKf3bbCe1KHJjE/dAZVsTmsi4KR1CRXpYhTAbX/QJcJVbpk+il5Py
         DHbqnSmRFNmSSnBOe/L8UogyPZYXpOPbjHjM/1226EQTC2nhCMVf+YRuQnkPvhjvxhq4
         Eh5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gMO+4PHG/t939Q89oLYKxNGAoD1wvOTj1EN3jlptu/4=;
        fh=I5g5vadhVzFpBicy3xzEa32o6ZBSkSDfJWBgNS8LKNE=;
        b=FAIkLQJ/RCdzQk4krKSVH5Q4enUTWxO5INl9FPQqRw6fXGg7KczN3QydwJNmPT2gr7
         Ybyrz69RXOm3bxgeMSABd2RPn4jRnqJJwsP1PxeDFpugLCGz6L73qhCKzhDW8LJzrZ76
         W5W3nvLklw2HT4h0laBanofeqLoM464GPyNV0BKQ0GVfxFS8R0wypEzfOQ55aFQIQwZn
         Q1hPU/NbtKdqxXx6UUtiOjTsIpySWJm5HxQpQVWZFMcVKaNC78cZ1lbcK9gfxueYRaSr
         vI4YKHIT3n01UvnquErBW0kPW58dBzfAR0XkbCQsKU841mdaQ1D9nsMzHHgvoqsakmio
         enjA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780813247; x=1781418047; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gMO+4PHG/t939Q89oLYKxNGAoD1wvOTj1EN3jlptu/4=;
        b=edLfJrLsIAJFtVVWHTTembX1dipUI+iP7HqTetsASNg0/39OyJ3g/+RgVifnLLrO9t
         PlZBGcR7U5CEQRz+mTRPcSIwnO9SBNfuPOhVGosNFTLh/4PKcudnC9aWMDdMqinIwJcE
         /emQg0cRUPQwkSRSoyWY1WkuDHQ6GN8fhiMUEU8CFM73sxsWULMqxU7i9T5vaDgpaB1y
         lBEA2dl497trtbcjzt9hkbd4AYdsEkLa16t5HLc4uzhzSyK6FWheTJ//l00GNnjbxB3G
         oBbJuEc7gpax312BpoFIMAm8nnNlFkDf1k759L+8qCTmt8KD5QjS0pfrs1g4E+kdpoS6
         d52A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780813247; x=1781418047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gMO+4PHG/t939Q89oLYKxNGAoD1wvOTj1EN3jlptu/4=;
        b=lpol5bqIPxX5M3E6tDOm3Uh3ZsR/hJwy/WpccLrDKIGfoU2QJ4QwsT9JhQN3w5cABj
         P4IMVWT1EneWFupKw7aksZCaV8izm0ljAeHEK9jiMoz9eTFVyK2wRkQ/9jby1ZsejHRm
         n1xUz2XilPNV5JU9hn9CVeHhfmjKMF8FldGB6AgXBAS1EfGdW80Tgm/CAnLtkxj6oLRM
         pcKGS0URaOTCH1ArT3p+3/AgAdxhIOWnORBD8NIJ4dM1DsuvIBC/6nZdqxdv3hxvnQZJ
         uML/7BvGENSbgrXnaPFMheIH4Pl16ezW9K0eYTT6k9JPJmfnM0H763L/vAe9INHLPtf0
         0HFg==
X-Forwarded-Encrypted: i=1; AFNElJ8LDzRbtTTCUBgwpoY6oIjHw2rV2wqnWzxyvKPwRby7SOQhE3NR4ModTVGgD9Br/kvATiNISyAxajw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwxawWfRdbRF8of1obcNiPkG4gYjGda0R8OumlmgZENMHJCf2+I
	i0NUSw5Ca3ULpNv5h7IogvL8h+ytBFV/kFtV0MT8HNsHtAf1RdQlJJEFRoZbD0LgaaUjn7gcT1U
	CalPrDJTHkyrCXZOiuV0qZah9EP77lQE3UlPWdueEgw==
X-Gm-Gg: Acq92OG4MYPuHmD9R2+iBKVUVZuYhoLd/R4Fw8Qta16K/wbIOYPYdwrq174TzCqeKfD
	SPY5RhJKph4Jgvqmh0MbU0gFaFgWQX4cDlAAOjEW3GuNSGZgZJtPT8ZnRsFYfz+nb9Evv2W3UqF
	KWUHIJR/p0I347xBhyjRuJszPPJOLl4ruthE29YhBNks7Yop7zcl68zyFErZ34JliVn9SO2N0vb
	tpKvxlUGxNexslW2CtRu98ZNdkrQ0w4XfbZcabKLbunM/IJtllGqUUelXBwxYpfhA3vfx3Mx+Fw
	NtLZ1IgTMCs+scqa9Y4a8ST6Z7O+p+9YHQUTHdUWJIlbVVCU47+te6IQ8190P07eOrMnaq5YUxp
	gtwNby5AnlQSD80OtjA8LDeOL3mZj6biyXDleWQ==
X-Received: by 2002:a05:6820:818f:b0:69e:424a:8df1 with SMTP id
 006d021491bc7-69e68b4b285mr5462614eaf.19.1780813247371; Sat, 06 Jun 2026
 23:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260604230317.30501-1-atwufei@163.com> <20260604230317.30501-3-atwufei@163.com>
In-Reply-To: <20260604230317.30501-3-atwufei@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 7 Jun 2026 11:50:35 +0530
X-Gm-Features: AVVi8CcWegt3ZsT9WLUI3VPXbOQxxt07m39USNjLbCcMB0d45zm2TY4QeUPVPog
Message-ID: <CAAhSdy0KLEaCevhDTR-vK4EFZuFV5Nc32eZHhqndOuXkqW4bEA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] RISC-V: KVM: Fix skip of valid pages in kvm_riscv_gstage_unmap_range
To: atwufei@163.com
Cc: seanjc@google.com, Atish Patra <atish.patra@linux.dev>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Wu Fei <wu.fei9@sanechips.com.cn>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260606_232048_473176_1B296AE0 
X-CRM114-Status: GOOD (  17.53  )
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

T24gRnJpLCBKdW4gNSwgMjAyNiBhdCA0OjMz4oCvQU0gPGF0d3VmZWlAMTYzLmNvbT4gd3JvdGU6
Cj4KPiBGcm9tOiBXdSBGZWkgPHd1LmZlaTlAc2FuZWNoaXBzLmNvbS5jbj4KPgo+IFNhbWUgYXMg
a3ZtX3Jpc2N2X2dzdGFnZV93cF9yYW5nZSwgdGhlIHBvc3NpYmxlIHZhbGlkIHBhZ2VzIHNob3Vs
ZCBub3QKPiBiZSBza2lwcGVkIGlmICFmb3VuZF9sZWFmLiBEaWZmZXJlbnQgZnJvbSB3cCBjYXNl
LCB3aGljaCBjYW4KPiB3cml0ZS1wcm90ZWN0IG1vcmUgdGhhbiBhc2tlZCwgdW5tYXAgY2FuJ3Qg
ZG8gdGhhdCwgbm8gc3BsaXR0aW5nIGlzCj4gYWRkZWQgcmlnaHQgbm93IGJ1dCBhIHdhcm5pbmcg
aXMgbG9nZ2VkIGluc3RlYWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBXdSBGZWkgPHd1LmZlaTlAc2Fu
ZWNoaXBzLmNvbS5jbj4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFp
bmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGlzIHBhdGNoIGZvciBMaW51eC03LjIKClRoYW5rcywKQW51
cAoKCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jIHwgMjAgKysrKysrKysrKysrLS0t
LS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vZ3N0YWdlLmMgYi9hcmNoL3Jpc2N2L2t2
bS9nc3RhZ2UuYwo+IGluZGV4IDJiMTQxYTc4ZWNhYy4uZDc4ZjVhZWI4YjQwIDEwMDY0NAo+IC0t
LSBhL2FyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vZ3N0YWdl
LmMKPiBAQCAtMzk1LDE1ICszOTUsMTkgQEAgdm9pZCBrdm1fcmlzY3ZfZ3N0YWdlX3VubWFwX3Jh
bmdlKHN0cnVjdCBrdm1fZ3N0YWdlICpnc3RhZ2UsCj4gICAgICAgICAgICAgICAgIGlmIChyZXQp
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4KPiAtICAgICAgICAgICAgICAgaWYg
KCFmb3VuZF9sZWFmKQo+IC0gICAgICAgICAgICAgICAgICAgICAgIGdvdG8gbmV4dDsKPiAtCj4g
LSAgICAgICAgICAgICAgIGlmICghKGFkZHIgJiAocGFnZV9zaXplIC0gMSkpICYmICgoZW5kIC0g
YWRkcikgPj0gcGFnZV9zaXplKSkKPiAtICAgICAgICAgICAgICAgICAgICAgICBrdm1fcmlzY3Zf
Z3N0YWdlX29wX3B0ZShnc3RhZ2UsIGFkZHIsIHB0ZXAsCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcHRlcF9sZXZlbCwgR1NUQUdFX09QX0NMRUFSKTsK
PiArICAgICAgICAgICAgICAgaWYgKCFmb3VuZF9sZWFmKSB7Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgYWRkciA9IEFMSUdOKGFkZHIgKyAxLCBwYWdlX3NpemUpOwo+ICsgICAgICAgICAgICAg
ICB9IGVsc2Ugewo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmICghKGFkZHIgJiAocGFnZV9z
aXplIC0gMSkpICYmICgoZW5kIC0gYWRkcikgPj0gcGFnZV9zaXplKSkKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGt2bV9yaXNjdl9nc3RhZ2Vfb3BfcHRlKGdzdGFnZSwgYWRkciwg
cHRlcCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHB0ZXBfbGV2ZWwsIEdTVEFHRV9PUF9DTEVBUik7Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgZWxzZSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBXQVJOX09OQ0Uo
MSwgIlNraXAgdW5tYXAgcmFuZ2UgYWRkcjogJSNsbHgsIGVuZDogJSNsbHgsIHBhZ2Vfc2l6ZTog
JSNseFxuIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBhZGRyLCBlbmQsIHBhZ2Vfc2l6ZSk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgfQo+Cj4g
LW5leHQ6Cj4gLSAgICAgICAgICAgICAgIGFkZHIgKz0gcGFnZV9zaXplOwo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGFkZHIgKz0gcGFnZV9zaXplOwo+ICsgICAgICAgICAgICAgICB9Cj4KPiAg
ICAgICAgICAgICAgICAgLyoKPiAgICAgICAgICAgICAgICAgICogSWYgdGhlIHJhbmdlIGlzIHRv
byBsYXJnZSwgcmVsZWFzZSB0aGUga3ZtLT5tbXVfbG9jawo+IC0tCj4gMi41MS4wCj4KCi0tIApr
dm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
