Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33A1CD6E69
	for <kvm-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 08:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tTKjhkiXyT25F7csEZ0Gzbsyh2rcBVGwUQIOt3704Vo=; b=mB+Xtc5rGks7Z9
	jWiU6dIiIqXagKde/wfPXbswQ4ekBbyVX7hvSPJmsRs/+payk7IpHvXVgUbS1545Ec0cxgCxEpSx9
	BUT1IGgpRVGG6cl0nsXnp0BURlDv4SjPd0Uxb7TcLh53mARS+0drHMGTC2Vv6ufzVsdOmFGG4wOyD
	ost+Gt/vb6pOnXcXB6DbNZ0kiHN8st+WBy5ZIMAJDWjdIRhk6va6w1PvkWSibrm+1RlgyHxUCVyqu
	42KKxsc4Q+brVFMMtfFwtTMK7+gXFYH92X8dHVinhSs7u1ohe+kWoeR4wU5rCvrgo/EQgDrcVg3lU
	MGJvG25ktfSFEs/rH0zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgoZ-0000000EYrx-2qbv;
	Wed, 03 Jun 2026 08:19:03 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgoW-0000000EYp9-3OSY
	for kvm-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 08:19:02 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-69e4a083687so251094eaf.3
        for <kvm-riscv@lists.infradead.org>; Wed, 03 Jun 2026 01:19:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780474739; cv=none;
        d=google.com; s=arc-20240605;
        b=k4mlz+eXM47YX+cxuGfqdYqv81Sa9vO537yL8rpE051J/BWQSQ0jTDlGyQYh2K34VH
         kxDsXDk8XkzW5uQfYaSPFRzjKdfonbCOkvD5FNfESTlKptrsVeNHvCnasaE9yKmVdlJd
         P53iLXHgZl0WY2J/rNLu5j29Z+Cb98IF+2G8PfeeAr5MkXI/PGpKx4CcjZeXK9G9q4qS
         Noc8dlRZ2DMGBlwoIe82bVVhfn1kogJKP4sZ49S/pVfBAiAE8EHtzH4AF2cl1bMH+qI/
         8zgpedVoKZuWTYiH+xT7K4LDModIpl3mXLbXkOmda1fNBrmJr5icSPoI/KQ74Va74AWa
         2w/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yygNmT61sYbCZArzAqt/fFbSogFcxsrnj7Jj0lk2HmA=;
        fh=0c9H/WV6O8/6+O6fXNPj6OuRprhmETCk0A9pbjuE9ns=;
        b=OzfxNl8MwncOtvLBCRfE9009AsTt7I481t9eJvuXf6AkVw1ArDgfb1BPvzrEgIoSPo
         tg2F/cb2pxKILLl9K7qHqCU+zs8GoPNr2NgN+nGDVk9IbRUY29A+0PnlICZJkbGyUxU6
         ZDP4x2X0AG5U52/SCeZUBeh3nb2w+llXBkSfcsbhDi8MvuXwPD5ed8O9H185RL9JY2rA
         h2lMYzGLu7P30Ra1ogGGbuHb3u8Yu0voCMhZV9SHCX1aAg7brUwuaeJYpVy4m8aov2d7
         EQS65wfaDDmVAIhtZpbInGyVs3SkGRi0khhjjaz1AR6BMHU2BaeD3beaE641rpJiZz17
         ZBZA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780474739; x=1781079539; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yygNmT61sYbCZArzAqt/fFbSogFcxsrnj7Jj0lk2HmA=;
        b=TLLaq/4aFpKa0o7mLhirqi1VvJeZi3UtHi1xd0bdd4WRd6McwK9ewe04rXh3a/JzIs
         JG1HL28ss48YwfPrHHvWaUM8zkVsb4lXI3xmUQchgjEQ0kWisrGVUUiJvyMHvw1tvD/V
         iJjqiFcKV/HiiIS0ZuLYsio3T0IVHmktxd8B+4TZcPsecZeHH2wNSWRo+75DOGTI8ZlQ
         9LqmVa90ix+MQi/xyRIpvQ003WU/HFZuVSrCRh29MbSL1zSFvh3LKPnPO3WoyJCuEk/p
         ZHk0LIdEY/fiRPFx81GeiKWCtoX8GKZ2TwALYJrwdfUZdbcomqKSsd+eyusHx4+Cc4R1
         WblQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780474739; x=1781079539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yygNmT61sYbCZArzAqt/fFbSogFcxsrnj7Jj0lk2HmA=;
        b=DQlvoJbbtdVckdIW4ymqD1TkfSRzm8Iq1Yc4X+aQmmtbhwrAT6RdSUYcm8OXy3gOPA
         V4fOlseblhPnfDOqDmLvTQcPpavW9b0MT7eoYaR99xc36rh48lz0NjU86lsTHCMYPqi6
         +Bs62N6rNlnaji2YzZKiecxD4nV3htgmg3gf94CS/PWCtRABb7JcgGuPa+ST6/QQ8TpU
         z+0PpLn9YXVb9L2bSyekqXgf0clqh65guKI0iuMh6RzSdcIw5OKuNvZ8stoaRdmBl3qu
         Pyh9bbkonn7jkEJEnOxBvuWkXQQ9kj4gnSnqsJ6M8IHMVQwqsdm4ewNiCb2+UjkQ70cF
         sfjQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ezZZUQ/86MM1rXehsycwDs01gkHVQDSe+vjOFBvGMwmvV5msL3w0NQtFZ9uv/uzR7eRZwdoicl2I=@lists.infradead.org
X-Gm-Message-State: AOJu0YwzPcJhfkNk3TQkuJR8NcVVMJuvaiKuc4LLevFOqtaNvcyI3yDi
	QxAIMO2IBwhjg2hX/Qz3tJEuWjpKVcsGP15LAr/3xblYV4OAyKd8/9sV1Fy7G2OxVxutn6FvZzn
	u7GUkCzXEmt0Ad+yfMjbGL9hINpoE1sUzhVXJKfyDNw==
X-Gm-Gg: Acq92OE6mXLrdjT8gr7N964lXPccnggHsReLvUUXRlZF5xDxcDRviV/tQnLQr60lMKN
	siIvMpMLHc7tpG1TwTu2pyZntP44jpMSy52Tkp4PIsPQz8WNvPyEL/83Dq9a4K++aqj1NvSzK/y
	A02/9s88vWlERRDeB8gQUbvnu70hh99Lr42H/OoalCVQrTosCTjVcmfHPXvbgYYHenBI8XdPicL
	rgTZNF4Kvn2BmPiinxE8ta4+UQceKcGchDTuZgz1hbAeaMXJMIylrqYSKM60lNLefres7bpomYv
	gVlY/L4AgCHcJclxTZupqCorUZgH2t8R5/u8ntMvDg94m2ULYaBBYVq1qDpjp4Kq7aKaa9o7oy+
	LYR85kZQ7CAAFraY6ObOItOUdYS2AE+mrsbYj4w==
X-Received: by 2002:a05:6820:280e:b0:69e:3e2a:a838 with SMTP id
 006d021491bc7-69e480c4e0amr960102eaf.52.1780474739437; Wed, 03 Jun 2026
 01:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260513153656847l3c4fI5hBsAyoIZi8aGIs@zte.com.cn> <20260513154500183qjAlxzbei98Q4B5HjLpMx@zte.com.cn>
In-Reply-To: <20260513154500183qjAlxzbei98Q4B5HjLpMx@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 3 Jun 2026 13:48:47 +0530
X-Gm-Features: AVHnY4LzHljWBAXzMy2Za5hYWEvR0vWNkdwQN5CLSrLnlnj2h9dY2gFEIxQeMAA
Message-ID: <CAAhSdy13aO5b7rXfE4eNz+r8cLUhN3-T_YMegRPE2=15KCR1+Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] RISC-V: KVM: Add the eager_page_split module parameter
To: wang.yechao255@zte.com.cn
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_011900_862651_48AAB55D 
X-CRM114-Status: GOOD (  19.90  )
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

T24gV2VkLCBNYXkgMTMsIDIwMjYgYXQgMToxNeKAr1BNIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPiB3cm90ZToKPgo+IEZyb206IFdhbmcgWWVjaGFvIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPgo+Cj4gQWRkIGFuIGVhZ2VyX3BhZ2Vfc3BsaXQgbW9kdWxlIHBhcmFtZXRlciBmb3IgUklT
Qy1WIEtWTSwgZm9sbG93aW5nCj4gdGhlIHNhbWUgYXBwcm9hY2ggYXMgb24geDg2LiBUaGlzIHBh
cmFtZXRlciBjb250cm9scyB3aGV0aGVyIGVhZ2VyCj4gcGFnZSBzcGxpdHRpbmcgaXMgZW5hYmxl
ZC4gVGhlIGRlZmF1bHQgdmFsdWUgaXMgb24uCj4KPiBXaGVuIGVhZ2VyIHBhZ2Ugc3BsaXR0aW5n
IGlzIGVuYWJsZWQsIEtWTSBwcm9hY3RpdmVseSBzcGxpdHMgbGFyZ2UKPiBwYWdlcyAoaHVnZSBw
YWdlcykgaW50byBzbWFsbGVyIHBhZ2VzIHdoZW4gbmVlZGVkIGZvciBkaXJ0eSBsb2dnaW5nCj4g
b3Igb3RoZXIgb3BlcmF0aW9ucy4gRGlzYWJsaW5nIGl0IGNhbiBiZSBiZW5lZmljaWFsIGZvciBW
TSB3b3JrbG9hZHMKPiB0aGF0IHJhcmVseSBwZXJmb3JtIHdyaXRlcywgb3IgdGhhdCBvbmx5IHdy
aXRlIHRvIGEgc21hbGwgcmVnaW9uIG9mCj4gbWVtb3J5LCBhcyBpdCBhbGxvd3MgaHVnZSBwYWdl
cyB0byByZW1haW4gaW50YWN0IGZvciByZWFkIGFjY2Vzc2VzLgo+Cj4gU2lnbmVkLW9mZi1ieTog
V2FuZyBZZWNoYW8gPHdhbmcueWVjaGFvMjU1QHp0ZS5jb20uY24+CgpVcGRhdGUgRG9jdW1lbnRh
dGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQgYXMgcGFydApvZiB0aGlzIHBh
dGNoLgoKUmVnYXJkcywKQW51cAoKCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL21tdS5jIHwgMTMg
KysrKysrKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9tbXUuYyBiL2FyY2gvcmlz
Y3Yva3ZtL21tdS5jCj4gaW5kZXggMmNkZWEzZTNlZDRiLi4yYWYwM2M0OGFmZjMgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+
IEBAIC0xNiw2ICsxNiw5IEBACj4gICNpbmNsdWRlIDxhc20va3ZtX21tdS5oPgo+ICAjaW5jbHVk
ZSA8YXNtL2t2bV9uYWNsLmg+Cj4KPiArYm9vbCBfX3JlYWRfbW9zdGx5IGVhZ2VyX3BhZ2Vfc3Bs
aXQgPSB0cnVlOwo+ICttb2R1bGVfcGFyYW0oZWFnZXJfcGFnZV9zcGxpdCwgYm9vbCwgMDY0NCk7
Cj4gKwo+ICBzdGF0aWMgdm9pZCBtbXVfd3BfbWVtb3J5X3JlZ2lvbihzdHJ1Y3Qga3ZtICprdm0s
IGludCBzbG90KQo+ICB7Cj4gICAgICAgICBzdHJ1Y3Qga3ZtX21lbXNsb3RzICpzbG90cyA9IGt2
bV9tZW1zbG90cyhrdm0pOwo+IEBAIC0xNDgsOCArMTUxLDEwIEBAIHZvaWQga3ZtX2FyY2hfbW11
X2VuYWJsZV9sb2dfZGlydHlfcHRfbWFza2VkKHN0cnVjdCBrdm0gKmt2bSwKPgo+ICAgICAgICAg
a3ZtX3Jpc2N2X2dzdGFnZV93cF9yYW5nZSgmZ3N0YWdlLCBzdGFydCwgZW5kKTsKPgo+IC0gICAg
ICAgaWYgKGt2bV9kaXJ0eV9sb2dfbWFudWFsX3Byb3RlY3RfYW5kX2luaXRfc2V0KGt2bSkpCj4g
LSAgICAgICAgICAgICAgIGt2bV9yaXNjdl9zcGxpdF9odWdlX3BhZ2VzKCZnc3RhZ2UsIHN0YXJ0
LCBlbmQsIHRydWUpOwo+ICsgICAgICAgaWYgKGt2bV9kaXJ0eV9sb2dfbWFudWFsX3Byb3RlY3Rf
YW5kX2luaXRfc2V0KGt2bSkpIHsKPiArICAgICAgICAgICAgICAgaWYgKFJFQURfT05DRShlYWdl
cl9wYWdlX3NwbGl0KSkKPiArICAgICAgICAgICAgICAgICAgICAgICBrdm1fcmlzY3Zfc3BsaXRf
aHVnZV9wYWdlcygmZ3N0YWdlLCBzdGFydCwgZW5kLCB0cnVlKTsKPiArICAgICAgIH0KPiAgfQo+
Cj4gIHZvaWQga3ZtX2FyY2hfc3luY19kaXJ0eV9sb2coc3RydWN0IGt2bSAqa3ZtLCBzdHJ1Y3Qg
a3ZtX21lbW9yeV9zbG90ICptZW1zbG90KQo+IEBAIC0yMTQsNyArMjE5LDkgQEAgdm9pZCBrdm1f
YXJjaF9jb21taXRfbWVtb3J5X3JlZ2lvbihzdHJ1Y3Qga3ZtICprdm0sCj4gICAgICAgICAgICAg
ICAgIGlmIChrdm1fZGlydHlfbG9nX21hbnVhbF9wcm90ZWN0X2FuZF9pbml0X3NldChrdm0pKQo+
ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybjsKPiAgICAgICAgICAgICAgICAgbW11X3dw
X21lbW9yeV9yZWdpb24oa3ZtLCBuZXctPmlkKTsKPiAtICAgICAgICAgICAgICAga3ZtX3Jpc2N2
X3NwbGl0X21lbW9yeV9yZWdpb24oa3ZtLCBuZXctPmlkKTsKPiArCj4gKyAgICAgICAgICAgICAg
IGlmIChSRUFEX09OQ0UoZWFnZXJfcGFnZV9zcGxpdCkpCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAga3ZtX3Jpc2N2X3NwbGl0X21lbW9yeV9yZWdpb24oa3ZtLCBuZXctPmlkKTsKPiAgICAgICAg
IH0KPiAgfQo+Cj4gLS0KPiAyLjI3LjAKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
