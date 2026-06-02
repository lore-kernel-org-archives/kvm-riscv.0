Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86150CD6E4A
	for <kvm-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 08:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r3wqEeShp27Zm64JJbDDJtDcKGrQC90MB1v9DGN1M4g=; b=o73fc2QnpEhxEO
	hdJP8NgWVPcwtNpRowLOrir/AN3Wpe3AAhrN1AI1/fkceumPPWW3mf8kV/GljU6ymFG0hzhhPsqI2
	/h3W/SQ3oUOunYd+AEfuWgMX6S9ob+R0CGL42Xn7b+fOFQwaLpNKvXaLVNF37ELiOSYr0OIEnYlMj
	SsOT29O5fT/kqsMwvRgVzPu3XzZsKuIKABTv7POeNOoSlggLoe1iQ0nHzrhBUqK2BMV7e4N4N8o2l
	CV4d1qTbzAma0mg554F1hAAb+lm+fQnTJOqQTV15uBI4zwNG2EdR8mVCaBJ7DCqXZho9D5MyJd+cL
	z1lLPBtF0D3gk7UfPsjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUK3Q-0000000CWef-1QZK;
	Tue, 02 Jun 2026 08:00:52 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUK3M-0000000CWdJ-2BEX
	for kvm-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 08:00:50 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-69d78547957so5681439eaf.0
        for <kvm-riscv@lists.infradead.org>; Tue, 02 Jun 2026 01:00:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780387247; cv=none;
        d=google.com; s=arc-20240605;
        b=V2JAUaIPCbLRM61AVQZY4Jutu6ytdUydrAdrFp43dQOeKEBUDeCdlheDw7+srSSWU8
         LS3a8qUjcLBtj52Shtk0fKP7X61PmJUyMdK2pRbfWEf4eLSfuV1Z0NM4jgvEcW9VNxzH
         0xqIVQ5/R7tl0pfYag2XUfBzXWd6xZAIbQo4fmZ7JbFI9fTJK9uRzXPrp3negeyaC8dv
         0Rzh0fEZWWdiOZFcVzKKJy8jGc7YxCIkCv/+gR7bb50/NbFO5gEyoe5Tp1edJYza5hx4
         7ywmrbgQu6cMKNNwwmtBSBKF8618aI+HgnOMBOu11iVOSWWT9ho8mAVxKxZ1iergnpCU
         mpjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IgrLvh/X4k97Px4HlbHkqTDpeesPxMpXfPyUt4B4fe8=;
        fh=EDCUeCgCee+nN7/pIMjm+8OWa7mfTN9EK+MMzFajaJc=;
        b=LhOA+Oimm0bYmcrwHIUNtS5H8Ue5kxqZWZ3uKnovbUhnx3zb00YdtYYuOe14LUVmm3
         OjfVpXen9afTLX1ASxL/z6tauXwyzWB5kN57dt07simq25CmcheRAt7ao3KUl+Qaw6pv
         zF+0Ao+J/wKlh3XeXxL/aDo2adp6EepYVZpyxCkHNfs0ODL29oHnRu1388Cytz0IPdXj
         p69HQPYw4ZvhcpkwVRXOlOVLGHxU0NLhvqmLtbws2TtaU1fc3jg1uu2dn/m/OkPCGvr+
         uBVEa/jC9pc7Em6OG2gMXqlBouycOfgBNDzDTDvEBTFajhdhAio9W1bOJm/htqFPUBMU
         xmyg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780387247; x=1780992047; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IgrLvh/X4k97Px4HlbHkqTDpeesPxMpXfPyUt4B4fe8=;
        b=tXD26SnwYn8wHaRimWDiGSZko1+Dc6CGSRhQd7/jxtkV/UIRYzmiVY9RL9xuWX2rHy
         SNZOHWy8kC3iXP3+So2l4Ecz8QPGVVv1pvJA02psx/2VqR5xkp9SEzcIMh8jzVlb0zzW
         r+hoQvRbimPf/6UPaNkpncGfA1HUM/UJcW2lVbCjq8tvPwODJ5002P41Q5ILQOnbi3IT
         rEn5XXQDl1MndwCNloTLu8GqmLAQw6SKlbr5N7M1EXyCX1BVr97Su2TsSVkJGytcJG4x
         bu8CQPOF4CgIPX/UfTr9Zg+3UE5O0Wg20U/dLJ8t4e55DzNqLxvAlUUiK83dgGMVtikd
         v/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780387247; x=1780992047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IgrLvh/X4k97Px4HlbHkqTDpeesPxMpXfPyUt4B4fe8=;
        b=Pb+CSHakE16y2tBNjFhEz/QT2xtojyB1hepvk+pjLX0hYOiHnKFhKSmBqMIR/Ve83j
         8R7DdC+v2nBgFRMnv51+93xGJclmv8O+dmOUCMPIaZYlHWgm2FejP8uyQ02E7WIYn8Xy
         WoET1CrilbhcXAMgE18yaDhn8wcqbp9JTHtoBC5j1S4+Tt+maou7Wp+mwAsbD+JjGwcd
         A0TGM0bBmuisXIsZi5zNHvGI5PU18JjHAwJBlcZK4GlRS48mtz2TBtjK4WXJxDfgxOnY
         pRK3oTKkIZsvRsPEaTzjHZIHv+IFpiHx6e9WScek4HlsdB/IkB8x/CVvM/nJ3uddR9om
         6Ygg==
X-Forwarded-Encrypted: i=1; AFNElJ89fiUcjy4HkHMcm7T6rduHQbdKUI81tbbKSKc2Lsvs2RQmM0AUEehIH4JVItuInzYVqm/fDxALLZ8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzzOolztkcVk3yqGYzVvAds95vTdSlgauD1OFGdGrV2Q46hjmA+
	NgdcmC2Om/fF9WNVhl06g28Tm+vdWsT4yrJQCaiVoIkX7P1WBuoEjlfDPspr43FYz1tordn2Pv5
	z5tFhcajHNpaqxitFcNAO32b/LWVMhda8Dyy7BZjgQA==
X-Gm-Gg: Acq92OGxW3AHVVcQdMEYpmEfsKpKm2xygfAWiWxRmjs50sjX+nFQ1TPUCHEouXp8IlO
	4ETlIT3MLr5zi12IVUfzvymCXKOmiZsc8uc2X3pLahoqAmLJjNMF/3VSOQsBfsWt29lSme6UAbh
	YGVQ/nrlcOKFr6UTESB6aqSfuzPrg/UA/SAlhUCYX73oTt6ZN6nauTnv56JErNFs6VjKVb8K2HL
	lBcSVR0ZasdV7Y1NzG1d+bOF0c0q+ekegzlOAQbkrWOcak3mU/oZ0H/Jb4ZihLIOVkyAYXL5jmM
	DDjMzzepJ7F5oRJp/ENkjuMJtw/tbOWMtsNxz1aotyI+Uu2sEWhppF0J8sQOnOETSZHY05PQlFa
	CqkYGA2hLaskKWUJkmD7Ji8YrqdGGYYn8krFHaq5JcneEY/wG
X-Received: by 2002:a05:6820:4d06:b0:69d:5138:5540 with SMTP id
 006d021491bc7-69e368628ecmr1455529eaf.9.1780387246859; Tue, 02 Jun 2026
 01:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <202605111849442561v1a0B_7W1L2Z-ENusLaP@zte.com.cn> <202605111130.64BBUjU6013213@mse-fl2.zte.com.cn>
In-Reply-To: <202605111130.64BBUjU6013213@mse-fl2.zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 2 Jun 2026 13:30:34 +0530
X-Gm-Features: AVHnY4Ly_ncquhNUG3b2y2WGAOsB8396bhb2a_G3mSJVFu24acqBWILI6kpavM8
Message-ID: <CAAhSdy25JUiM2QnJbvqsQBu5eaB4L2TdSNfkmaaqFMjNOk+Stg@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_2=2F3=5D_RISC=2DV=3A_KVM=3A_Fix_skip_of_valid_pages?=
	=?UTF-8?Q?_in=C2=A0kvm=5Friscv=5Fgstage=5Fwp=5Frange?=
To: wu.fei9@sanechips.com.cn
Cc: linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, pbonzini@redhat.com, 
	shuah@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_010048_813518_44810B1C 
X-CRM114-Status: GOOD (  17.16  )
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

T24gTW9uLCBNYXkgMTEsIDIwMjYgYXQgNTowMOKAr1BNIDx3dS5mZWk5QHNhbmVjaGlwcy5jb20u
Y24+IHdyb3RlOgo+Cj4gVGhlIGN1cnJlbnQgZ3N0YWdlIHJhbmdlIHdhbGtlciB1bmNvbmRpdGlv
bmFsbHkgYWR2YW5jZXMgYnkgJ3BhZ2Vfc2l6ZScKPiB3aGVuIGEgbGVhZiBQVEUgaXMgbm90IGZv
dW5kLCBlLmcuIHdoZW4gdGhlIHJhbmdlIHRvIHdwIGlzCj4gWzB4ZmZmZmYwMWZjMDAwLCAweGZm
ZmZmMDIzYzAwMCkgYW5kIHBhZ2Vfc2l6ZSBpcyAyTUIsIGlmIGZvdW5kX2xlYWYgb2YKPiAweGZm
ZmZmMDFmYzAwMCByZXR1cm5zIGZhbHNlLCBpdCBza2lwIHRoZSB3aG9sZSByYW5nZSwgYnV0IGl0
J3MgcG9zc2libGUKPiB0byBoYXZlIHZhbGlkIGVudHJpZXMgaW4gWzB4ZmZmZmYwMjAwMDAwLCAw
eGZmZmZmMDIzYzAwMCkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBXdSBGZWkgPHd1LmZlaTlAc2FuZWNo
aXBzLmNvbS5jbj4KCkkgc2VlIGFsbCB0YWJzIGNvbnZlcnRlZCB0byBzcGFjZXMuIExvb2tzIGxp
a2UgdGhpcyBwYXRjaCB3YXMKbm90IHNlbmQgdXNpbmcgZ2l0IHNlbmQtZW1haWwuCgpQbGVhc2Ug
cmViYXNlIGFuZCBzZW5kIHVwZGF0ZWQgc2VyaWVzIHVzaW5nIGdpdCBzZW5kLWVtYWlsLgoKUmVn
YXJkcywKQW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vZ3N0YWdlLmMgfCAxNiArKysrKysr
Ky0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vZ3N0YWdlLmMgYi9hcmNoL3Jpc2N2
L2t2bS9nc3RhZ2UuYwo+IGluZGV4IGQ5ZmU4YmUyYTE1MS4uMmIxNDFhNzhlY2FjIDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vZ3N0
YWdlLmMKPiBAQCAtNDI5LDE0ICs0MjksMTQgQEAgdm9pZCBrdm1fcmlzY3ZfZ3N0YWdlX3dwX3Jh
bmdlKHN0cnVjdCBrdm1fZ3N0YWdlICpnc3RhZ2UsIGdwYV90IHN0YXJ0LCBncGFfdCBlbmQKPiAg
ICAgICAgICAgICAgICAgaWYgKHJldCkKPiAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsK
Pgo+IC0gICAgICAgICAgICAgICBpZiAoIWZvdW5kX2xlYWYpCj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgZ290byBuZXh0Owo+IC0KPiAtICAgICAgICAgICAgICAgYWRkciA9IEFMSUdOX0RPV04o
YWRkciwgcGFnZV9zaXplKTsKPiAtICAgICAgICAgICAgICAga3ZtX3Jpc2N2X2dzdGFnZV9vcF9w
dGUoZ3N0YWdlLCBhZGRyLCBwdGVwLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwdGVwX2xldmVsLCBHU1RBR0VfT1BfV1ApOwo+IC1uZXh0Ogo+IC0gICAgICAgICAg
ICAgICBhZGRyICs9IHBhZ2Vfc2l6ZTsKPiArICAgICAgICAgICAgICAgaWYgKCFmb3VuZF9sZWFm
KSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgYWRkciA9IEFMSUdOKGFkZHIgKyAxLCBwYWdl
X3NpemUpOwo+ICsgICAgICAgICAgICAgICB9IGVsc2Ugewo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGFkZHIgPSBBTElHTl9ET1dOKGFkZHIsIHBhZ2Vfc2l6ZSk7Cj4gKyAgICAgICAgICAgICAg
ICAgICAgICAga3ZtX3Jpc2N2X2dzdGFnZV9vcF9wdGUoZ3N0YWdlLCBhZGRyLCBwdGVwLAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHB0ZXBfbGV2ZWws
IEdTVEFHRV9PUF9XUCk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgYWRkciArPSBwYWdlX3Np
emU7Cj4gKyAgICAgICAgICAgICAgIH0KPiAgICAgICAgIH0KPiAgfQo+Cj4gLS0KPiAyLjQzLjAK
Ci0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
