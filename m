Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3310CD6E55
	for <kvm-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 08:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iLS2umhKNA6xolJTVkShPt1FeZT/Tf5i14jIVHW+J2A=; b=l9ic8FP0Hh1KDj
	gicUl0kZpPhkZseVhwyyXRa9Y9fBZ+KC7HyWr56n7GloGCMILMhtVscQAnl6Ky1iC6ZIRXlR4Oxaa
	hfblE/TinlROPulXm4Rcr3IFWnSUG7as2lCMCrBLF1yznCa0h7upsZ1ovxBHbF4oORPYHeMegR23H
	C8YzOaf0QUomLasrICnJ+6honKUEZMsvwbRRf+A5joYYXUn5f1oVB7x94ANMI8mpJTGx6LP5pi2g6
	DtwENpWnbRwlIQMPS0GbXDQHcAShTZZIBUrOQmhukpX5DkYaPR+s6dHvyQM5rDrJyx1/izbmgrM04
	q20obThjx68Nf08DFVVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgoT-0000000EYoY-1J3E;
	Wed, 03 Jun 2026 08:18:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgoS-0000000EYoI-00d3
	for kvm-riscv@bombadil.infradead.org;
	Wed, 03 Jun 2026 08:18:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4egfNNVt2xLa6zMUvxHb6G3XcxjPLrCxY/SLCryO8sQ=; b=NHO/CvNYAvTqgJVQLyPggwGjVJ
	XuxCVMN5UsKjuJ5mrwlWugJkmZuFJumWPRjnXsWKnUeU7nsmlmEU4bocUcPz2SgAQf8J+T6QQzg3y
	kmcsqhNGfti6KXAQJ9o8Hs5Rp3iBKoUeHwgGnL9r6Beiot8VVuy9thD/O9SY4AYlHft/lE0bEv31+
	acFMBNyW1CUcej7Y6vhGlfrXA/AujLiKR9fsEwakjFESoUWAxpF9DyrwE9i5CU/k09r1mps6uqsTl
	jml1FXgLwFBAIkSNUI/IMM0wVC6/cs76mNvOMBVaERli7ogUk0gee+8wWjmpUV4moPSTRtYbwsaph
	hYd7Inzg==;
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUgoO-0000000BYUH-2GHl
	for kvm-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 08:18:54 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7e6d2f297f4so1109825a34.2
        for <kvm-riscv@lists.infradead.org>; Wed, 03 Jun 2026 01:18:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780474730; cv=none;
        d=google.com; s=arc-20240605;
        b=L6+P5Hlp2buUFsyhTpoWLh0xpi1rx3NbHLiALXR1stb7Rh8w+TVUEfIisLgm6/BW4Z
         IRgJse5aQEt4JqMl34Z5t9UeBzvgy9VBpKCj/AILa6Xaiwe6bJlinhYI5+kIWsIA5ALZ
         hx2wRtMLWjyb0NtLLMJkSg1UDreYk+wPCF8yYqAq3lPSF3d2N5gDdIa2ZKmgkeLMlVMr
         43HHhpQwydfUDgiSMfIIKIlPxlRmUmwc0kjzbVAXeIG3RWBDXl3NPa/4llSIm3UMzhWE
         i/U1ekYbXioZ4Qit4brFpdCCEBk/HP7DLBtT2TiQoEVfznLNmV/F08XNydDdPt2FSbYB
         v/mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4egfNNVt2xLa6zMUvxHb6G3XcxjPLrCxY/SLCryO8sQ=;
        fh=Co7HyfEsvqI/nusQL1x/nPDzY9kD3omx6FfqJPkrrV8=;
        b=VQeOHTVmE/lzALQNuNEb+mKspMDTbxGU4Sg5yGeSPeHJz8S6V6wSOfEyp2D/TIvbxB
         Dred7tSKoB0TJltC2QoJ/iZbtQWyCsfRW91fvpxQjR6FloC4k+afqBk+tPLsnpwRRuMD
         0fJfG4bv+kHNjG4MKEseu9wvhjuKBuaFw9JL8g7WoA9JZm6pXjInsOjFFfhs8ez10wCt
         ADvES9gCZwOFOHMwsEoSTPULsSd3cj8mT5P0NBz/L0yZR836tS4Q4KTAb+zJ+rQ9SVse
         j1xmUHqDTN37FDUtCNChw6EzPag6h4aJ3DqmKWFsTrKMDMI5qxelA6vHNF2FbP0pyIrx
         aXDw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780474730; x=1781079530; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4egfNNVt2xLa6zMUvxHb6G3XcxjPLrCxY/SLCryO8sQ=;
        b=RGySxos9iCNEhg2/BKxvjFS+IjzH+Q1ly9QkoBRlvJwH71SuXCeLiF1qAH6e3LXJ/7
         6xHaWR+lxQamCD0azTzy4sDfFqk63ujfkSYYDTRqjq4x6Ln17x3bQuWIrwDWrpvf9wS+
         q/oXCN/US7jJ81X5LHsjYVF/gOkYf2PKNmnwHVm8P/zXUvCC3djuIxZsQ10iU6wB03fE
         dgG5bSDtJDDvFSXjel+L7WGbhlHbQslAgV0b0EDMAAHpv/vxmPf/2RYt8ZBGCWzhtaGJ
         WEbNHa8YuMpYGNABU/tJMBpqIseTloDuXnE0ruHYdgpOXaipy+9qBFhgaz44RCa3RW+m
         EgvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780474730; x=1781079530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4egfNNVt2xLa6zMUvxHb6G3XcxjPLrCxY/SLCryO8sQ=;
        b=Fmo15XPDzhI2ckey2Yj7FefgAsXNy/udRbIYlf3EuQE2OQGMoEvdFj1qxZ/sHQ3WdL
         0YJ5UcuKch87oAragylyIz/WoqzfTIq81lg7rLMfJq+XzFFmX+tB5es50/dtueK5zh9t
         Ium8zgMxogLF+zkGbXeuS+A5QoCwldacEi5Tno6SzjjKNsB4Qh/Wf9kxCkbuvhelbK8f
         wwtrt3NuAxA6RLiFzed2JpfLT9YMB3R5R/GxKTw856+9odV+W6xsf7YIwhFpwC86h85K
         iVh3DXfpFMv2gD8rMuFQqeVFnLB9eBLWjvXBw4C01SvjBxUHrS67+Of2gj6uM/yjnJi1
         htUw==
X-Forwarded-Encrypted: i=1; AFNElJ9ZEzT7plOxo8ZMmUUjJqO6IiASE3SEEn4LaDXNYhZyLafSsI1k15Vq/nJO4afgEyAy/VN9utwTfgo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyDE+CHIC4mDM8U00aQCUpLbSwwQT6jHB4kEPJM758RzKL7c3Vq
	0054UU1J3hAYYsJVUuIfPTJbKWzmigWvnT6LVwmMzOuPP6tWBAcZPT5xPMPmvs5yZD8aHhegNSC
	YOhN6SFvnB9qaGS8pmB7YJ1orLggj6RwpUCr+ck9Utg==
X-Gm-Gg: Acq92OHmBauORlnQBLJ7Rw3AUMOMskYiFUIiYGL34oLzxfo/pyokp+kR4u3L4KGj9We
	k6iVw3dJu8lPnRMy+62fkpb1K8POeXwBPHprxIn1clHRLErbRozi8s6yt2h0qZwow3cyvINTSPh
	IH4nXwrRD93WN2X1Aybd2l/DrymfepjeUxOF/2OeBShnTZpDLuOREM0n1kNGyjuQRyA1ArFnXnj
	VC1Rxfd2XtoxE3u7uzppZncCbTacI/rcl+6w/HadVVBpC/PEHR+K5spIFQry3Sldbd9R7FUXihE
	XIMnuUXtGWFR0Mcq0Mzd60SSfgKN/YNA6/DDziJr/+IFCJEh/HwGkEbr5HeSolMdZUG3rWenrYt
	DyIxYiO9EZA9zDLwbuzn2v5KPAyw5XdjHvuxtQg==
X-Received: by 2002:a05:6820:54c3:b0:69d:d865:92a1 with SMTP id
 006d021491bc7-69e480c295amr1114390eaf.46.1780474730648; Wed, 03 Jun 2026
 01:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260513153656847l3c4fI5hBsAyoIZi8aGIs@zte.com.cn> <20260513153901371U0gWZRa45N893VGbU7Gf9@zte.com.cn>
In-Reply-To: <20260513153901371U0gWZRa45N893VGbU7Gf9@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 3 Jun 2026 13:48:38 +0530
X-Gm-Features: AVHnY4LEigot4AhNtC66fZLcPPwlJCbOuFMHio3ko1GV9_2T4M4j-tjxNz4y7Bc
Message-ID: <CAAhSdy0Wd2=hmJ_1ZXa1mB6ojt32HeA8AW43=GLh52_5DuZqmw@mail.gmail.com>
Subject: Re: [PATCH 1/4] RISC-V: KVM: Add the split page cache for ioctl context
To: wang.yechao255@zte.com.cn
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_091852_758908_FDF39442 
X-CRM114-Status: GOOD (  15.90  )
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

T24gV2VkLCBNYXkgMTMsIDIwMjYgYXQgMTowOeKAr1BNIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPiB3cm90ZToKPgo+IEZyb206IFdhbmcgWWVjaGFvIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPgo+Cj4gQWRkIHRoZSBzcGxpdCBwYWdlIGNhY2hlIGZvciBkaXJ0eSBsb2dnaW5nIGVuYWJs
ZW1lbnQgYW5kIHRoZQo+IEtWTV9DTEVBUl9ESVJUWV9MT0cgaW9jdGwuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBXYW5nIFllY2hhbyA8d2FuZy55ZWNoYW8yNTVAenRlLmNvbS5jbj4KPiAtLS0KPiAgYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIHwgMiArKwo+ICBhcmNoL3Jpc2N2L2t2bS9t
bXUuYyAgICAgICAgICAgICAgfCAzICsrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAo+IGluZGV4IDc1YjBhOTUxYzFiYy4u
ZTJmNDA4NTQzMDVmIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hv
c3QuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAo+IEBAIC05Myw2
ICs5Myw4IEBAIHN0cnVjdCBrdm1fYXJjaCB7Cj4KPiAgICAgICAgIC8qIEtWTV9DQVBfUklTQ1Zf
TVBfU1RBVEVfUkVTRVQgKi8KPiAgICAgICAgIGJvb2wgbXBfc3RhdGVfcmVzZXQ7Cj4gKwo+ICsg
ICAgICAgc3RydWN0IGt2bV9tbXVfbWVtb3J5X2NhY2hlIHNwbGl0X3BhZ2VfY2FjaGU7CgpSZW5h
bWUgaXQgdG8gcGdkX3NwbGl0X3BhZ2VfY2FjaGUgYW5kIGFkZCBpdCBiZWxvdwpwZ2RfbGV2ZWxz
LgoKPiAgfTsKPgo+ICBzdHJ1Y3Qga3ZtX2NwdV90cmFwIHsKPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rdm0vbW11LmMgYi9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+IGluZGV4IDJkM2RlZjAyNDI3
MC4uODVhM2ZiMjYyMmE0IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gKysr
IGIvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiBAQCAtNTQ5LDYgKzU0OSw3IEBAIGludCBrdm1fcmlz
Y3ZfbW11X2FsbG9jX3BnZChzdHJ1Y3Qga3ZtICprdm0pCj4gICAgICAgICBrdm0tPmFyY2gucGdk
ID0gcGFnZV90b192aXJ0KHBnZF9wYWdlKTsKPiAgICAgICAgIGt2bS0+YXJjaC5wZ2RfcGh5cyA9
IHBhZ2VfdG9fcGh5cyhwZ2RfcGFnZSk7Cj4gICAgICAgICBrdm0tPmFyY2gucGdkX2xldmVscyA9
IGt2bV9yaXNjdl9nc3RhZ2VfbWF4X3BnZF9sZXZlbHM7Cj4gKyAgICAgICBrdm0tPmFyY2guc3Bs
aXRfcGFnZV9jYWNoZS5nZnBfemVybyA9IF9fR0ZQX1pFUk87Cj4KPiAgICAgICAgIHJldHVybiAw
Owo+ICB9Cj4gQEAgLTU3Miw2ICs1NzMsOCBAQCB2b2lkIGt2bV9yaXNjdl9tbXVfZnJlZV9wZ2Qo
c3RydWN0IGt2bSAqa3ZtKQo+Cj4gICAgICAgICBpZiAocGdkKQo+ICAgICAgICAgICAgICAgICBm
cmVlX3BhZ2VzKCh1bnNpZ25lZCBsb25nKXBnZCwgZ2V0X29yZGVyKGt2bV9yaXNjdl9nc3RhZ2Vf
cGdkX3NpemUpKTsKPiArCj4gKyAgICAgICBrdm1fbW11X2ZyZWVfbWVtb3J5X2NhY2hlKCZrdm0t
PmFyY2guc3BsaXRfcGFnZV9jYWNoZSk7Cj4gIH0KPgo+ICB2b2lkIGt2bV9yaXNjdl9tbXVfdXBk
YXRlX2hnYXRwKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAtLQo+IDIuMjcuMAoKUmVnYXJkcywK
QW51cAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlz
Y3YK
