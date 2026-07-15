Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6A1C44501
	for <kvm-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 11:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fOVEKv6hY9JmdlRzrp2o8PEtvDd4r6vzq3OhXQFH+e0=; b=yIY+sf03gzdquJ
	CDpoyc8n8ZMT26BQEKYxclGgaVe0xwGCDaM6GhaDncOV9f9p6g2QEajkzzuzzlQbiw0BaAgAjHe0M
	rzloq3WGo2rprx81YFyvYtFtBwUVt8su4pKFhg8Q9ir2nOmv3RpO/64KWZlSMU18NzZ/RHkUOpgKk
	cg+cHQnvV66r+xkQXjEXjuakXBsWKinoF9aKk7CETZobvsU7yN3FG/JJjLVwB/CScddRdhKXIMUPt
	naIu6wT1856co20MLweQDi+nbXVpE8zbXbKEJ6CfKkVOrRiD993FVi1CBqScPVskpPc3wyCJdJweA
	yUWbBI9HZhSCQwVL5O2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxuk-0000000EbEr-240G;
	Wed, 15 Jul 2026 11:36:34 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxui-0000000EbCs-37Tw
	for kvm-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 11:36:34 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7ea9c6ea7deso3672541a34.3
        for <kvm-riscv@lists.infradead.org>; Wed, 15 Jul 2026 04:36:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784115389; cv=none;
        d=google.com; s=arc-20260327;
        b=jnA6L2/SqYCSifj6FV5XQEyOoZztvnZ46s0Cfvlr1Jm5TWBIOrO0+hPOFIfMeGoSuX
         zvaM1EUpdefCaiy3enIvigQfgnOojBJAq3dAauKNWED1ABvztYu0tWRHk1hcGnoXmc43
         DzsPYMh6+v4ejy66Jme8DIAL2mX5j36p81yP+voLhi22deUvWxT4fmEsd30o+c6bTmfz
         NXABXtUFW2Hs6ZXexrkO2KuB2BLjLL696BBA8HJvq335fBH+rZiYMGn+pmSY8v9KLEe/
         7XfnJ5l3Qij7oEiV0jBDzr24rzPArzpI/L1sWaMzn93CfjSLlSafQ44Myf2PKudtikc9
         MBwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7ZEtkZBQmdX0etetnBFbvuoc6k7xP4dTkloxYVpfa9w=;
        fh=jXqOao/Zxo7LT2I6G2IEM+I91mddHYhdz3+JCjG6Tfg=;
        b=OhVa25SuRrdhqPzGrLx1FpSV2jad6ZifiW5wegXLVIsAj0KeQYzTLyvRMsZaPKidG/
         Hkimr0UnRNJD+kAVnWx2Avws2OBoEafLL3iQxr8+24iuqFe1wBiHn1KxYwTUHJymCqQi
         +cj8lMh5XfpwGcbAOg4Ioms4/lCOy5DQ9aF7QTdnwx58ROXbQBW/cRAtb0LeXZsher+t
         2c5ngKUJZMf+LRZ8WKB+NK7skBNb1z9EesBDxUQJ4uxCF7WRNyxc9U0+iGJn9gLzsmd3
         3KblzpV0iLa7uau3jaDRdYSOx2rNbvdvAJky0fsOcI1c7P76yEQ+7oFk6uh/gGhMTcMI
         1HcQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784115389; x=1784720189; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7ZEtkZBQmdX0etetnBFbvuoc6k7xP4dTkloxYVpfa9w=;
        b=UEL4LNUE8TvQWQVMenh8PwINNiVhJB47rXfZPbBk5cMW/pqLemW3Q9/7GQLyjuBmHq
         SJFBXP5SH9uf1kfwVAOlMSL9i0KmWAbb+QzJzz8Jdjy4j934OwFehEkP75Q20c55E/Rm
         ZbZ/cgW6OiCjCNXzJDKD89QNr6hVwp/Rrm/azzItK4ONKsXijTGz80IjuMYWsL4FKu87
         YtELAknEowvRG6Y4cGoEqvVZT/vHwweZ/TxeoVMBvuGXuaSDWxISGrTs9ETxtR8m0f/Q
         /tme0tlIU7RRAOyLx/ZQN/l1kf0VfWILq7LvucZtn121tWbKtD2AdUpp+XwRtz3KVQ5Y
         HvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784115389; x=1784720189;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ZEtkZBQmdX0etetnBFbvuoc6k7xP4dTkloxYVpfa9w=;
        b=KzaVQ8Xcrkl5pcvWqgGxKm1rDQgRz3gkq+Hxd1UWNih3noaBksiAfphXhL/cBIkMFI
         CKTxw+56AgERNNXlVtx6/niclE18vAeEY38nUSs5vQ3KfG11Gu3IMcvHUJli8txfsY3f
         yly+lZXIzWwPM77Pg1hAPwrgtJmTgcvg0nIUXKl9uN9dUwi+LJTuVKmqi3Sc68KAne3B
         IgXZFEqlstKKhC5pVCdEVD7BQwt6jr+tvKdlKi6FyTp7FAz0MgAtqEKzFWQW27lDR6+Z
         wwcImP825K4fZL+kpLCCd4ldLQuBZoGS5KSC9xETcbsXvff2OOQUt/v3ldpnt1dS+Mzt
         d07Q==
X-Forwarded-Encrypted: i=1; AHgh+RrggrzYCUqDOs/2ZIZ46U/LTIcj9JvpvwQ4llG/k61U6vlqdokxXsQ3V8w8FTrk1cKiRGJfnDQcNm4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwvfrpslQcwyhARnoNR8aEH/LEAL/qYiOBnMtANjx0DtQvGqmxn
	v5a7BYCH3qNTalSN8UXbFL19k4VYVkPrFZ7wnVLygDup6QOem2uK5EfOKT15TVsvuM77zr2j4sf
	x8xRwHBPDTyUIYHKnAr0V11k9hDyK9q2A2nrZH9p3OA==
X-Gm-Gg: AfdE7clLKKMfp4puwyFvMlhckzzdXLBzcYo8KAJxMT/o+gIQ3tMVvc0mdTLz7qZwczE
	yIezuhrxh9QGxE9nh39fuwOSPm9rKNYB85WQM7h10N4GmovFgaXif/qQaniosJ2Md7lxEswtBLk
	obIlI8wb1bgMPIqjoxDpki8GUgYLCvgLtGKiCoWtdY2cBZsY32xc52wrRVdE4sqW4+o/peY2VAe
	x0lj0F1q4jO1vX3+iKivymhYvXDaRbfQPaILKlMJqDElFvgt/pZsBOOk3r0qmwGfmrkK64U5uc=
X-Received: by 2002:a05:6830:6d4f:b0:7e6:e1d2:3bd0 with SMTP id
 46e09a7af769-7ec420f059fmr4345745a34.10.1784115388897; Wed, 15 Jul 2026
 04:36:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260421092457.37649-1-cuiyunhui@bytedance.com> <62c418bc-082b-4ae2-a889-f63dd2b7f503@kernel.org>
In-Reply-To: <62c418bc-082b-4ae2-a889-f63dd2b7f503@kernel.org>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 15 Jul 2026 19:36:16 +0800
X-Gm-Features: AUfX_my7GduNMyP3_qMrw3wVYCX4eNM5Te_gdOiwtTrcP35i3khqzqzTVVZ3zhc
Message-ID: <CAEEQ3wm72=CKNxXsSszZqiWDSHDZcAUgppxXxEAXyCy=uB+zaw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v1 0/7] riscv: add Svnapot-based contiguous
 PTE support
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: akpm@linux-foundation.org, alex@ghiti.fr, andrew+kernel@donnellan.id.au, 
	andreyknvl@gmail.com, anup@brainfault.org, aou@eecs.berkeley.edu, 
	apopple@nvidia.com, ardb@kernel.org, atish.patra@linux.dev, 
	baolin.wang@linux.alibaba.com, debug@rivosinc.com, 
	djordje.todorovic@htecgroup.com, dvyukov@google.com, elver@google.com, 
	glider@google.com, ilias.apalodimas@linaro.org, junhui.liu@pigmoral.tech, 
	kasan-dev@googlegroups.com, kees@kernel.org, kevin.brodsky@arm.com, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	liu.xuemei1@zte.com.cn, ljs@kernel.org, namcao@linutronix.de, 
	osalvador@suse.de, palmer@dabbelt.com, pjw@kernel.org, rmclure@linux.ibm.com, 
	rostedt@goodmis.org, rppt@kernel.org, ryabinin.a.a@gmail.com, 
	surenb@google.com, vincenzo.frascino@arm.com, vishal.moola@gmail.com, 
	wangruikang@iscas.ac.cn, zhangchunyan@iscas.ac.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_043632_796422_23878BA9 
X-CRM114-Status: GOOD (  17.50  )
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

SGkgRGF2aWQsCgpPbiBUdWUsIEFwciAyMSwgMjAyNiBhdCA3OjI44oCvUE0gRGF2aWQgSGlsZGVu
YnJhbmQgKEFybSkKPGRhdmlkQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gNC8yMS8yNiAxMToy
NCwgWXVuaHVpIEN1aSB3cm90ZToKPiA+IEhpLAo+ID4KPiA+IEZpcnN0IG9mIGFsbCwgdGhhbmtz
IHRvIFJ5YW4gUm9iZXJ0cyBmb3IgdGhlIHdvcmsgb24gbVRIUCBhbmQKPiA+IENvbnRpZ3VvdXMg
UFRFIHN1cHBvcnQgb24gYXJtNjQuIFRoYXQgd29yayBwcm92aWRlcyBhIHZlcnkgdXNlZnVsCj4g
PiByZWZlcmVuY2UgZm9yIHJlZHVjaW5nIHBhZ2UgZmF1bHQgb3ZlcmhlYWQgYW5kIFRMQiBwcmVz
c3VyZSBmb3IKPiA+IGxhcmdlIGJ1dCBzdGlsbCBQVEUtbWFwcGVkIG1lbW9yeSByYW5nZXMuCj4g
Pgo+ID4gVGhpcyBzZXJpZXMgYWRkcyBTdm5hcG90LWJhc2VkIGNvbnRpZ3VvdXMgUFRFIHN1cHBv
cnQgZm9yIFJJU0MtVi4KPiA+Cj4gPiBUbyBhY2hpZXZlIHNpbWlsYXIgYmVuZWZpdHMgb24gUklT
Qy1WLCB0aGlzIHNlcmllcyBpbnRyb2R1Y2VzIGEKPiA+IENvbnRpZ3VvdXMtUFRFLWxpa2UgbWVj
aGFuaXNtIGJ1aWx0IG9uIHRvcCBvZiB0aGUgU3ZuYXBvdCBleHRlbnNpb24uCj4gPiBUaGUgaW50
ZW50IGlzIHRvIHByZXNlcnZlIHRoZSBjb3JlLU1NIFBURSBzZW1hbnRpY3Mgd2hpbGUgYWxsb3dp
bmcKPiA+IFJJU0MtViB0byB0cmFuc3BhcmVudGx5IGZvbGQgZWxpZ2libGUgYmFzZS1wYWdlIG1h
cHBpbmdzIGludG8KPiA+IFN2bmFwb3QtZW5jb2RlZCBjb250aWd1b3VzIG1hcHBpbmdzIHdoZW4g
cG9zc2libGUuCj4gPgo+ID4gVGhlIHNlcmllcyBzcGxpdHMgdGhlIGxvdy1sZXZlbCByYXcgUFRF
IGhlbHBlcnMgZnJvbSB0aGUgcHVibGljCj4gPiBjb3JlLU1NLWZhY2luZyBQVEUgaGVscGVycywg
c28gdGhhdDoKPiA+Cj4gPiAtdGhlIF9feHh4IGhlbHBlcnMgZXhwb3NlIHRoZSByYXcgaGFyZHdh
cmUgUFRFIGVuY29kaW5nLAo+ID4gLXRoZSB4eHggaGVscGVycyBwcm92aWRlIHRoZSBzZW1hbnRp
YyB2aWV3IGV4cGVjdGVkIGJ5IGNvcmUgTU0sCj4gPiAtYW5kIFN2bmFwb3QtYXdhcmUgaGFuZGxp
bmcgaXMgY2VudHJhbGl6ZWQgaW4gdGhlIHB1YmxpYyB3cmFwcGVyIGxheWVyLgo+Cj4KPiBKdXN0
IGN1cmlvdXMsIGlzIHRoZXJlIG9wcG9ydHVuaXR5IHRvIHNoYXJlIHNvbWUgb2YgdGhlIGNvZGUg
d2l0aCBhcm02NCwKPiBmYWN0b3Jpbmcgb3V0IGhlbHBlcnMgdGhhdCBoYW5kbGUgc29tZXRoaW5n
IGxpa2UKPiBDT05GSUdfQVJDSF9IQVNfQ09OVElHX1BURVMgPwoKYXJtNjQgY29udHB0ZSBhbmQg
UklTQy1WIFN2bmFwb3QgbG9vayBzaW1pbGFyIGF0IGEgaGlnaCBsZXZlbCwgYnV0IHRoZXkKZG8g
bm90IG1vZGVsIGNvbnRpZ3VvdXMgbWFwcGluZ3MgaW4gdGhlIHNhbWUgd2F5LiBhcm02NCBrZWVw
cyBvcmRpbmFyeQpiYXNlIFBURXMgYW5kIGFkZHMgUFRFX0NPTlQsIHdoaWxlIFN2bmFwb3QgZW5j
b2RlcyBhIG5hdHVyYWxseSBhbGlnbmVkCnJhbmdlIGRpcmVjdGx5IGluIHRoZSBQVEVzLiBCZWNh
dXNlIG9mIHRoYXQsIHRoaXMgc2VyaWVzIGV4cG9zZXMgYQpsb2dpY2FsIHBlci1wYWdlIHN1Yi1Q
VEUgdmlldyB0byBnZW5lcmljIE1NLCB3aGlsZSBrZWVwaW5nIHRoZSByYXcKU3ZuYXBvdCBlbmNv
ZGluZyB1bmRlcm5lYXRoLgoKU28gdGhlIGRpZmZlcmVuY2VzIGFyZSBub3Qgb25seSBpbiB0aGUg
bG93LWxldmVsIGVuY29kaW5nLCBidXQgYWxzbyBpbgp0aGUgcHVibGljIFBURSBzZW1hbnRpY3Mg
YW5kIGluIHNvbWUgb2YgdGhlIGZvbGQvdW5mb2xkIGFuZCBUTEIgcnVsZXMuCgo+Cj4KPiAtLQo+
IENoZWVycywKPgo+IERhdmlkCgpUaGFua3MsCll1bmh1aQoKLS0gCmt2bS1yaXNjdiBtYWlsaW5n
IGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
