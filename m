Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E004CA6017
	for <kvm-riscv@archiver.kernel.org>; Sat, 10 Oct 2026 07:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3seJ0tK3tdgoeSxmMvjpBxFJL31EvdnL8eTs1BkJn/k=; b=yS1CrzVy03g9Li
	5I67VDg+rwWTftOVzrfOLQZGB3GNc+WnuSyZDuup0Azxb3CS6RDyNi2hkg6U3astSouQNQGMA1+FZ
	MdRLVerA4/nYwQM0KJUbBe6GrzKPE4PzrmJz28hZaCRF07/cN44MaABgFAxrGemEW8+ZfzYdNa0r0
	ZqnBDsF3PTCYb9KVMvOhJP3rK5OgIyEh69hVRKk3to5nlEDK7lPaKLypRQFt9vpzpFCI9UK608Xbx
	ikmlCBxd0hUQPYVwIgBI5GWZR8wF40LMy+eUJUY66tdf1t+o4tznJ3xkBiVOKQgHfk7Pyr1kNY0iH
	PUzhWHAjCtvWWXhgwwIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFRiZ-00000007c95-3zc9;
	Sat, 10 Oct 2026 07:42:07 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFRiX-00000007c8L-1GfL
	for kvm-riscv@lists.infradead.org;
	Sat, 10 Oct 2026 07:42:06 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48c02782159so247124f8f.0
        for <kvm-riscv@lists.infradead.org>; Sat, 10 Oct 2026 00:42:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791618123; cv=none;
        d=google.com; s=arc-20260327;
        b=T9j6PnWTA6Vzk/u+XlLkSll0KMyQj9wg4w5XaVOHAJIyL2Kq3oOlDDyOHs0IEhGNwV
         G/sVwUTg5YN0SrMQY23BIsOu+HpM0t8GEhnWqJtvigOrTbviGUiXOU5EylBfJmYPBs6M
         sGYaU1wnAhHcxs5JulKVfwGNeF7wjmc98fw0FEoB7nQoRgPOok0jGAp+TU4lWjUFgAIH
         igUEHwymUM7m9uKAKrure36Q4tzOaH7Wjxr1FsAj67YnWneYkaJpl89J3zbaCWJU3y2C
         VCPX8VmZODxgov6ByPCr7i/fodqPkFTkvzAD6ZfxJVxGK38H/M4k0fDp7vH5gnh9NIFL
         3EHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XCywv9S23B5H539wqDzYaEMewRr3bUq+EMOyebbIFcQ=;
        fh=wq9z1mJFCh24dxBFAXsmoMDEnP2GRjPc6Mh3wRVljI8=;
        b=XW51pveaj+t80UkLp9iNx05KWd4G6E7iYKuMPksBkzP4G/GvtTrGLyio9VEdarkpn+
         9qZbzzPHfsMt2xkdnBTykVImoAWvXPRT9aQW6cKP6CMAqGViHu4gJK9o3CDkrP2tU8eN
         N+DajJUNEg+Vh0tL45lY6v9uhI1/Sp3zU0yI8aaM+yfsQ9UZLi0jN/i5ZEbSFbMZgEEq
         FPGYJ9m808E5MC8tU6hQg7ZdItyKGVTvCZLp35+BcPxw7NF307BQzHlrGzfRB7nbjk+Z
         QNZ/Cq9kmqnQdQt195bP/iQW8RjtYO9kME1YG1khn638+wmuQU5/Kz2aKyQkIARtMKqZ
         RAIw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791618123; x=1792222923; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XCywv9S23B5H539wqDzYaEMewRr3bUq+EMOyebbIFcQ=;
        b=WmS+ga8y9FcnRKsSFY8O+mrYALxbHF/ZuDnGhjkccGo6BuZbb5JccAe/FeCLX+Sy+2
         A1NdfnIkYQZuXCpyOa5/ba0ZBz6I5Pect122jbAAqRDhusg+6wyw+0ppvnO9VgtgfSoE
         FYqPeg4fiGcPgW7QbhXkggGsuLWWDGGZQuZUUIQqOZBcHCz04iiXGYig5UpUjWNFgYZE
         RJI3gW2Nx+00eHfJBFv24jEyUGqXfHeiAjh/bzwTiP68F54cFyFrwGhorNbxlIul2d8J
         o4SL/fjhLR0G0LFVvCp3RHWAyHVc2pu1GF4aU7NLbNqFYh2ew7mp3QUkm0p75Sn6hIFC
         kGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791618123; x=1792222923;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XCywv9S23B5H539wqDzYaEMewRr3bUq+EMOyebbIFcQ=;
        b=p/Bxjy0pouqbRqA6a4meF8Xqd2s9huSbCQdArjagZ7ko0nufxyN6OWRikm7ewW0wUn
         RPUkQxTOzd9opChlmkqeZ7Uv00ANDUXVeou75no29M39F5kjgrVaLoxyuXxlPaVG7eoL
         IVrxxDLAheYSB5vDx1poEK6HJTAqJUQSX+D2/IZjZzTIBa6Ow0Sz7EGbnrkjFEV+auKa
         F5/JSeasTeGyUuDHtYRjD7Oy91+UqcvnXZvZV8uFSpm3+i28M1goJnKr6KD1vJivqqbl
         jsTy+Q7IwDdQRuvVhTBLJo5og4mm/tZGGyqFMo1j04afPoHCC7M8/ZtGd0Rs3dANMYn/
         zb9Q==
X-Forwarded-Encrypted: i=1; AKwUvBx6bo6CdK2s47ANiywtBG+Ysuypl4aqDY7wC5l2+DycjlaugzRW29k6uwjJ4NtHb8rWG41oO7JF2No=@lists.infradead.org
X-Gm-Message-State: AFq9FYIcdvlBf9wneidzry65yzY2xk+LYUQVpvnDsQsglcsoexHRc62/
	pPCXNtUW3XepD397Agx/hYk/ezieWf7SjEyRw3cn9RUDHFKyranc63GayawSs5jJ8W52eB27nqO
	JTW7g9GmxCAyxc1oYsPrhoivob8Kh/LnVdfhEbbeX1w==
X-Gm-Gg: AYBFou05E5KuuqTQ2tCXQeIwnY01gi7oNi257Gfhyt9IHpYmP2qRM4czVuu7S2JM262
	NrcAs8RlUuqHZ67bOv47y0TyHJrfiZyg0sJwhdphbXsFXkXh4Yw6/M6Z9M8NekvaZAwrTBGA15D
	LGAONXvCkMSi/pjGvyGrYKLVVN3T/NEarCDXCrowqmjmcoO+9xITDxDv6lFJ22eRGgt4MFxTrKw
	kPpAUQzR5w+JTz5SQW/pToHdKzboN9eWgyPBmqu8m7fbJ0HClnQhOfLwe2Z/f6NbYAD7FIX4Nqg
	WnjBCqIkqOgbX7RnVAhn6Cz6YWJ/MOwu87LvxgwsxmdVKlobfcUJhtpEL0odqgKbkmnOZHksnno
	INaAD1E3zw75GWPGuQ3vVyRcQTjRCZpEIHdXTYSZBfHmVS2e8Eww1vchrs23qB5T9IcioyNRYgf
	XEcWVtSJR4
X-Received: by 2002:a05:6000:2589:b0:487:218b:bbb0 with SMTP id
 ffacd0b85a97d-48dbace804bmr7344901f8f.42.1791618122986; Sat, 10 Oct 2026
 00:42:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260922021823.44251-2-zhangzhanpeng.jasper@bytedance.com>
In-Reply-To: <20260922021823.44251-2-zhangzhanpeng.jasper@bytedance.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 10 Oct 2026 09:41:51 +0200
X-Gm-Features: AclHuK9QWngkeEhzbFvhRp9fejpKyh1bo8KVOKD4O89AFCZfZ54-3_jc6EqtE_s
Message-ID: <CAAhSdy1d-hW8Kj1rFEjfY_Q24j+V5N9tXciUcY36nMmkrUNKiA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix build with vector support disabled
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: Atish Patra <atish.patra@linux.dev>, Andy Chiu <tchiu@tenstorrent.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_004205_410367_77E524A2 
X-CRM114-Status: GOOD (  18.24  )
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

T24gVHVlLCBTZXAgMjIsIDIwMjYgYXQgNDoxOOKAr0FNIFpoYW5wZW5nIFpoYW5nCjx6aGFuZ3po
YW5wZW5nLmphc3BlckBieXRlZGFuY2UuY29tPiB3cm90ZToKPgo+IFRoZSBrZXJuZWwtbW9kZSB2
ZWN0b3IgY29udGV4dCBoYW5kbGluZyBhZGRlZCB1bmNvbmRpdGlvbmFsIGNhbGxzIHRvCj4gZ2V0
X2NwdV92ZWN0b3JfY29udGV4dCgpLCBwdXRfY3B1X3ZlY3Rvcl9jb250ZXh0KCkgYW5kCj4gX19r
dm1fcmlzY3ZfdmVjdG9yX3Jlc3RvcmUoKSBpbiB2Y3B1LmMuIFdpdGggQ09ORklHX1JJU0NWX0lT
QV9WPW4sIHRoZXNlCj4gY2FsbHMgZmFpbCB0byBidWlsZCBkdWUgdG8gbWlzc2luZyBkZWNsYXJh
dGlvbnMuCj4KPiBUaGUgZ2V0L3B1dCBoZWxwZXJzIGFscmVhZHkgaGF2ZSBuby1vcCBkZWZpbml0
aW9ucyBpbiBhc20vdmVjdG9yLmgsIGJ1dAo+IGt2bV92Y3B1X3ZlY3Rvci5oIG9ubHkgaW5jbHVk
ZXMgdGhhdCBoZWFkZXIgd2hlbiBDT05GSUdfUklTQ1ZfSVNBX1YgaXMKPiBlbmFibGVkLiBJbmNs
dWRlIGl0IHVuY29uZGl0aW9uYWxseSBhbmQgcHJvdmlkZSBhIG5vLW9wIGltcGxlbWVudGF0aW9u
Cj4gb2YgX19rdm1fcmlzY3ZfdmVjdG9yX3Jlc3RvcmUoKSBmb3IgdGhlIGRpc2FibGVkIGNvbmZp
Z3VyYXRpb24sIG1hdGNoaW5nCj4gdGhlIG90aGVyIHZlY3RvciBjb250ZXh0IGhlbHBlcnMuCj4K
PiBUaGUgcGF0aHMgdGhhdCBzZXQgUklTQ1ZfVl9WQ1BVX05FRURfUkVTVE9SRSBhcmUgY29tcGls
ZWQgb3V0IHdoZW4gdmVjdG9yCj4gc3VwcG9ydCBpcyBkaXNhYmxlZCwgc28gdGhlIHJlc3RvcmUg
c3R1YiBkb2VzIG5vdCBkaXNjYXJkIGFueSBsaXZlCj4gdmVjdG9yIHN0YXRlLiBLZWVwIGl0IF9f
YWx3YXlzX2lubGluZSBmb3IgaXRzIG5vaW5zdHIgY2FsbGVyLiBUaGUgdmVjdG9yCj4gZW5hYmxl
ZCBpbXBsZW1lbnRhdGlvbiBpcyB1bmNoYW5nZWQuCj4KPiBGaXhlczogYjUwNjBhNGFhMzNkICgi
UklTQy1WOiBLVk06IGZpeCB2Y3B1IHZlY3RvciBjb250ZXh0IGhhbmRsaW5nIGZvciBrZXJuZWwt
bW9kZSB2ZWN0b3IiKQo+IFNpZ25lZC1vZmYtYnk6IFpoYW5wZW5nIFpoYW5nIDx6aGFuZ3poYW5w
ZW5nLmphc3BlckBieXRlZGFuY2UuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVs
IDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUXVldWVkIHRoaXMgcGF0Y2ggZm9yIExpbnV4LTcuNAoK
VGhhbmtzLApBbnVwCgoKPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV92
ZWN0b3IuaCB8IDYgKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92
Y3B1X3ZlY3Rvci5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV92ZWN0b3IuaAo+
IGluZGV4IDYzNzFkNWVhNTM5Mi4uNTBkNDc4OWI5Y2FjIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfdmVjdG9yLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2t2bV92Y3B1X3ZlY3Rvci5oCj4gQEAgLTExLDkgKzExLDkgQEAKPiAgI2RlZmluZSBf
X0tWTV9WQ1BVX1JJU0NWX1ZFQ1RPUl9ICj4KPiAgI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+Cj4g
KyNpbmNsdWRlIDxhc20vdmVjdG9yLmg+Cj4KPiAgI2lmZGVmIENPTkZJR19SSVNDVl9JU0FfVgo+
IC0jaW5jbHVkZSA8YXNtL3ZlY3Rvci5oPgo+ICAjaW5jbHVkZSA8YXNtL2t2bV9ob3N0Lmg+Cj4K
PiAgc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkIF9fa3ZtX3Jpc2N2X3ZlY3Rvcl9zYXZlKHN0
cnVjdCBrdm1fY3B1X2NvbnRleHQgKmNvbnRleHQpCj4gQEAgLTU1LDYgKzU1LDEwIEBAIHN0YXRp
YyBpbmxpbmUgdm9pZCBrdm1fcmlzY3Zfdl9leGl0KHZvaWQpCj4KPiAgc3RydWN0IGt2bV9jcHVf
Y29udGV4dDsKPgo+ICtzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgX19rdm1fcmlzY3ZfdmVj
dG9yX3Jlc3RvcmUoc3RydWN0IGt2bV9jcHVfY29udGV4dCAqY29udGV4dCkKPiArewo+ICt9Cj4g
Kwo+ICBzdGF0aWMgaW5saW5lIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfdmVjdG9yX3Jlc2V0KHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSkKPiAgewo+ICB9Cj4KPiBiYXNlLWNvbW1pdDogOTNmNTE1NzllN2Rm
MjQ4NzgwMjE0MDk0NDE4ZjIwNTI1MzM4M2NjNQo+IC0tCj4gMi41MC4xIChBcHBsZSBHaXQtMTU1
KQo+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNj
dgo=
