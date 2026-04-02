Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A723FD3943C
	for <kvm-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 14:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WNqSN+rwAEI315mD0bJnJclN5u+4AZetVPIpUwGF0uI=; b=gkwbz36agm/O72
	PQRAJSuz3kHaoGJZ238gxKZIqsfLARUYQjauwe2Oc0SCr2KQtx8T0u0Xk4IKVMbl6HkDZmRQ05T5I
	Hct6ghFzqx7MEk9od49UdQDP8a8ncmiOg5QAnFtYuZIjun8Iy2cTzIHAflxu4P/dAlv1KjBQZBKv9
	h+4XZ8NXwWsk9jb8PI/dKqcB0mQvU0vTKKW9csvEOpmjKX1p59qeRDlNNOY9KdIXtWgTZzVloZI9H
	H6B/m2+b84H9JfL6xPFg6MWssuHTraO0Mcn0c6i05Vvsx5zPp+idNHtMauWuIFid1Ar14E2X0kBOy
	Fy6w+Jq9WA8a+TlcSb+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JNU-00000000NXW-0qvm;
	Thu, 02 Apr 2026 14:50:36 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JNR-00000000NWn-2vOL
	for kvm-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 14:50:34 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-6811db37922so311979eaf.3
        for <kvm-riscv@lists.infradead.org>; Thu, 02 Apr 2026 07:50:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775141433; cv=none;
        d=google.com; s=arc-20240605;
        b=TPSQOjeUJz9BqqmsPqqM++zUY1Z8vZKOVja2gG3AK9cIXuMAx5/cCqin415D9n9orN
         Es7fJ+a3Ztj+TM6ymnrejXBorgzB3evScvvUs9AyU0J4jU8yxqjzwVM9euvwt4hyzbzO
         pLCPJugOIlHm7XRHYDsoXVLmow3iv1EsQTAEg8KCBwymrwM4duyf31Cwiusu0wCmlr2Q
         6hQw3b2mfLbFzdqUhLHvdWtc/79NejgbfU1JqCBstlQ7q0xqf2QvYyLPp9HadcxJR9+W
         /SAVxY5GVTb9YujITsRTDGtvGxB/QThbKNUicg/ZJBHVsUNjR766KtPRpBhtpQLE63K0
         jenA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=za6pvBAfLHdL3QlDjUc6Bu/xHQp9xLt2WtsbUx+6jAc=;
        fh=nM9imlWv4avUByxkBVz0/Mwnclr0/tC19CzLG0t32EA=;
        b=GzFFlFIyb5FRGHBubRDKAM5Je/ZJTm5zohHdNMGheQLUHAWooUPoxZHpuRXrEKja7r
         d9P63kT0DEy2RwHQrNPNkAKZUGMjouJf3PyNxBPwZBu6wi3u3d02BgoADRZA0JZX8rIJ
         Fdct4SxN+T93nUKtfg+gta0een9TKPhw9dMeF+VQl6i4F+pGYGwD/vVM7aUANVm2cudO
         COdtZhRM3s9YwHaiP0rNRBuwSMfgmtqPN24TdxXDeQhQ3qaNlLHOg/Q3F9B31a/lqplE
         O76muxIu8Uj8eO8T2eJ1nBj5NNgAgsKhh03QneEkKEtwTeZ5Q9gZL1Hzla7GJfVMy0rr
         ZemA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1775141433; x=1775746233; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=za6pvBAfLHdL3QlDjUc6Bu/xHQp9xLt2WtsbUx+6jAc=;
        b=Zu9uZJP1fDw5BGukaShmk9bu41zMcEl68wbnNaK1uehpB2ODYN4BdMFa9AQskvaKFH
         VybUtpwyMG0zLlIZpDch1WBVz862E+WGuIgX3XhYtoMh6PRDWdoKjpEJpALpCr/Yd2Xg
         XAf/FmJXbBh6MkR8Eq0s679XaXbDHoeGTf4ikfg+U0IgO2apK3k4gXq3FviooChNib1D
         ZJlC+ulfBBPqfGU2GSqN1wOpzsJ5dX/gzix3US3Wc+0ZvcTd8Avi7GVp5+hyE8gu/do4
         FL6lqz3QcPp1NerdXz4WNHDaEx3ov8ph2bi4yhA91yA0U/B+0c52/5QVpHLkIyXL2p77
         +lcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775141433; x=1775746233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=za6pvBAfLHdL3QlDjUc6Bu/xHQp9xLt2WtsbUx+6jAc=;
        b=AfwhGItRa1ldLt5a20hgvrhjqgVQdyqIdp/IMCqLjCzd9AZEH3VBsv5wymviky9UV4
         3Gpzc2Ogv5Iesi1OpWdrjKLpOKLJn2aXHkvAIhPrCt6JsSSy6OVBAgbKmPm2XwR22bvB
         taUTrzpXfh1/QEsL/lVGQbxvfOYeK68mS4l4/2wEevpU7pqB87fvsPXTe5fBXj37amX/
         rhGby4VNxq8U2cyWdJVAnnWL/13jL/G6s9v+KZQKZFyMFkkv7SKqojqKGKjAmkr6tiJS
         kmziab1Rn14CpCVl2kn1zM2mLoup4TUuFN+TgvzD20NOpeJy11jzIzT0h4UAYyDLG0En
         F2dw==
X-Forwarded-Encrypted: i=1; AJvYcCXE1fiL4xB1o5BE2lp2h5S9vucdBVrU4+d9owzULigv0fKX3ioWcuCQWqZUiVyyVMBlqIXN3J9M370=@lists.infradead.org
X-Gm-Message-State: AOJu0YzOtlBTFVZh/ZsMHcZD4G/WgbIJJzbHsZiwtHOHpbweyTslUBh5
	0IfuR0QM8vC6mHn1IpZTFwENnKY1Ja5lyjZSVKvV4y3vO1QvFexeTdRduDkATmrd1HE6iUtZg/H
	SLtBFsi1Zge5v/zQ9mKxBtPuIkId8oRmZmkHKhVlbWA==
X-Gm-Gg: ATEYQzw2rc157P9G8GwVubjWKFC+K5o1dTInFyyXWwfwqQOa3GDycimf1SdGLHLylY1
	5OYlTuyNUgUHOzz9RW3BH4e4S2OJxNWlMZyOcJZynFXGhvLwA7xVGKOKqmkAXlZ2OQPfkCqA9TR
	Bhj5x6LwrfvjH6786TehS0eIXgw65FRzW4FCwl1DhdDVTVNo3Qk6oS3rNDRQGPUIs/RAM/z/hQc
	64qEEn/U3oLShgiDqkUeItPmQJWYLVldfZgHTlVHgddSbhUQk53Ta6deEnscTJ+HjWCwkn7tlia
	sXFKqSqQtTdrLzg+1i9Wp9OWkEzualTo3JTxpMeXUzUZrtJlbbU2DXApV4SlXzGzwr9e6I+nBzJ
	xFy/kUexXRxd4XfhMyIF3D82KMw==
X-Received: by 2002:a05:6820:f02d:b0:67c:2d5e:e9dd with SMTP id
 006d021491bc7-680a7a68576mr2046653eaf.41.1775141432576; Thu, 02 Apr 2026
 07:50:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260402132303.6252-1-fangyu.yu@linux.alibaba.com> <20260402132303.6252-5-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260402132303.6252-5-fangyu.yu@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 2 Apr 2026 20:20:21 +0530
X-Gm-Features: AQROBzDsAUAZSEerDJEeGwby7bjL0ghYgE-l4zOLT0yiweIOZblDgrBFsbDEbI0
Message-ID: <CAAhSdy1dXxdF0pb_r+hS+rdZ21VVxezwaZ=MCMmDD+vRCyRUdA@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] RISC-V: KVM: add KVM_CAP_RISCV_SET_HGATP_MODE
To: fangyu.yu@linux.alibaba.com
Cc: pbonzini@redhat.com, corbet@lwn.net, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	skhan@linuxfoundation.org, guoren@kernel.org, radim.krcmar@oss.qualcomm.com, 
	andrew.jones@oss.qualcomm.com, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_075033_768060_B63BC79B 
X-CRM114-Status: GOOD (  28.63  )
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

T24gVGh1LCBBcHIgMiwgMjAyNiBhdCA2OjUz4oCvUE0gPGZhbmd5dS55dUBsaW51eC5hbGliYWJh
LmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBGYW5neXUgWXUgPGZhbmd5dS55dUBsaW51eC5hbGliYWJh
LmNvbT4KPgo+IEFkZCBhIFZNIGNhcGFiaWxpdHkgdGhhdCBhbGxvd3MgdXNlcnNwYWNlIHRvIHNl
bGVjdCB0aGUgRy1zdGFnZSBwYWdlIHRhYmxlCj4gZm9ybWF0IGJ5IHNldHRpbmcgSEdBVFAuTU9E
RSBvbiBhIHBlci1WTSBiYXNpcy4KPgo+IFVzZXJzcGFjZSBlbmFibGVzIHRoZSBjYXBhYmlsaXR5
IHZpYSBLVk1fRU5BQkxFX0NBUCwgcGFzc2luZyB0aGUgcmVxdWVzdGVkCj4gSEdBVFAuTU9ERSBp
biBhcmdzWzBdLiBUaGUgcmVxdWVzdCBpcyByZWplY3RlZCB3aXRoIC1FSU5WQUwgaWYgdGhlIG1v
ZGUgaXMKPiBub3Qgc3VwcG9ydGVkIGJ5IHRoZSBob3N0LCBhbmQgd2l0aCAtRUJVU1kgaWYgdGhl
IFZNIGhhcyBhbHJlYWR5IGJlZW4KPiBjb21taXR0ZWQgKGUuZy4gdkNQVXMgaGF2ZSBiZWVuIGNy
ZWF0ZWQgb3IgYW55IG1lbXNsb3QgaXMgcG9wdWxhdGVkKS4KPgo+IEtWTV9DSEVDS19FWFRFTlNJ
T04oS1ZNX0NBUF9SSVNDVl9TRVRfSEdBVFBfTU9ERSkgcmV0dXJucyBhIGJpdG1hc2sgb2YgdGhl
Cj4gSEdBVFAuTU9ERSBmb3JtYXRzIHN1cHBvcnRlZCBieSB0aGUgaG9zdC4KPgo+IFNpZ25lZC1v
ZmYtYnk6IEZhbmd5dSBZdSA8ZmFuZ3l1Lnl1QGxpbnV4LmFsaWJhYmEuY29tPgo+IFJldmlld2Vk
LWJ5OiBBbmRyZXcgSm9uZXMgPGFuZHJldy5qb25lc0Bvc3MucXVhbGNvbW0uY29tPgo+IFJldmll
d2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiAtLS0KPiAgRG9jdW1lbnRhdGlv
bi92aXJ0L2t2bS9hcGkucnN0IHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIGFy
Y2gvcmlzY3Yva3ZtL3ZtLmMgICAgICAgICAgICB8IDE4ICsrKysrKysrKysrKysrKystLQo+ICBp
bmNsdWRlL3VhcGkvbGludXgva3ZtLmggICAgICAgfCAgMSArCj4gIDMgZmlsZXMgY2hhbmdlZCwg
NDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL3ZpcnQva3ZtL2FwaS5yc3QgYi9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2FwaS5yc3QK
PiBpbmRleCAwMzI1MTY3ODNlOTYuLjlkN2Y2OTU4ZmE4MSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL3ZpcnQva3ZtL2FwaS5yc3QKPiArKysgYi9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2Fw
aS5yc3QKPiBAQCAtODkwMiw2ICs4OTAyLDMzIEBAIGhlbHBmdWwgaWYgdXNlciBzcGFjZSB3YW50
cyB0byBlbXVsYXRlIGluc3RydWN0aW9ucyB3aGljaCBhcmUgbm90Cj4gIFRoaXMgY2FwYWJpbGl0
eSBjYW4gYmUgZW5hYmxlZCBkeW5hbWljYWxseSBldmVuIGlmIFZDUFVzIHdlcmUgYWxyZWFkeQo+
ICBjcmVhdGVkIGFuZCBhcmUgcnVubmluZy4KPgo+ICs3LjQ3IEtWTV9DQVBfUklTQ1ZfU0VUX0hH
QVRQX01PREUKPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gKwo+ICs6QXJj
aGl0ZWN0dXJlczogcmlzY3YKPiArOlR5cGU6IFZNCj4gKzpQYXJhbWV0ZXJzOiBhcmdzWzBdIGNv
bnRhaW5zIHRoZSByZXF1ZXN0ZWQgSEdBVFAgbW9kZQo+ICs6UmV0dXJuczoKPiArICAtIDAgb24g
c3VjY2Vzcy4KPiArICAtIC1FSU5WQUwgaWYgYXJnc1swXSBpcyBvdXRzaWRlIHRoZSByYW5nZSBv
ZiBIR0FUUCBtb2RlcyBzdXBwb3J0ZWQgYnkgdGhlCj4gKyAgICBoYXJkd2FyZS4KPiArICAtIC1F
QlVTWSBpZiB2Q1BVcyBoYXZlIGFscmVhZHkgYmVlbiBjcmVhdGVkIGZvciB0aGUgVk0sIGlmIHRo
ZSBWTSBoYXMgYW55Cj4gKyAgICBub24tZW1wdHkgbWVtc2xvdHMuCj4gKwo+ICtUaGlzIGNhcGFi
aWxpdHkgYWxsb3dzIHVzZXJzcGFjZSB0byBleHBsaWNpdGx5IHNlbGVjdCB0aGUgSEdBVFAgbW9k
ZSBmb3IKPiArdGhlIFZNLiBUaGUgc2VsZWN0ZWQgbW9kZSBtdXN0IGJlIHN1cHBvcnRlZCBieSBi
b3RoIEtWTSBhbmQgaGFyZHdhcmUuIFRoaXMKPiArY2FwYWJpbGl0eSBtdXN0IGJlIGVuYWJsZWQg
YmVmb3JlIGNyZWF0aW5nIGFueSB2Q1BVcyBvciBtZW1zbG90cy4KPiArCj4gK0lmIHRoaXMgY2Fw
YWJpbGl0eSBpcyBub3QgZW5hYmxlZCwgS1ZNIHdpbGwgc2VsZWN0IHRoZSBkZWZhdWx0IEhHQVRQ
IG1vZGUKPiArYXV0b21hdGljYWxseS4gVGhlIGRlZmF1bHQgaXMgdGhlIGhpZ2hlc3QgSEdBVFAu
TU9ERSB2YWx1ZSBzdXBwb3J0ZWQgYnkKPiAraGFyZHdhcmUuCj4gKwo+ICtgYEtWTV9DSEVDS19F
WFRFTlNJT04oS1ZNX0NBUF9SSVNDVl9TRVRfSEdBVFBfTU9ERSlgYCByZXR1cm5zIGEgYml0bWFz
ayBvZgo+ICtIR0FUUC5NT0RFIHZhbHVlcyBzdXBwb3J0ZWQgYnkgdGhlIGhvc3QuIEEgcmV0dXJu
IHZhbHVlIG9mIDAgaW5kaWNhdGVzIHRoYXQKPiArdGhlIGNhcGFiaWxpdHkgaXMgbm90IHN1cHBv
cnRlZC4gU3VwcG9ydGVkLW1vZGUgYml0bWFzayB1c2UgSEdBVFAuTU9ERQo+ICtlbmNvZGluZ3Mg
YXMgZGVmaW5lZCBieSB0aGUgUklTQy1WIHByaXZpbGVnZWQgc3BlY2lmaWNhdGlvbiwgc3VjaCBh
cyBTdjM5eDQKPiArY29ycmVzcG9uZHMgdG8gSEdBVFAuTU9ERT04LCBzbyB1c2Vyc3BhY2Ugc2hv
dWxkIHRlc3QgYml0bWFzayAmIEJJVCg4KS4KPiArCj4gIDguIE90aGVyIGNhcGFiaWxpdGllcy4K
PiAgPT09PT09PT09PT09PT09PT09PT09PQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3Zt
L3ZtLmMgYi9hcmNoL3Jpc2N2L2t2bS92bS5jCj4gaW5kZXggNGQ4MmE4ODYxMDJjLi41ZTgyYTNh
ZDNhZDAgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdm0uYwo+ICsrKyBiL2FyY2gvcmlz
Y3Yva3ZtL3ZtLmMKPiBAQCAtMjAxLDYgKzIwMSw5IEBAIGludCBrdm1fdm1faW9jdGxfY2hlY2tf
ZXh0ZW5zaW9uKHN0cnVjdCBrdm0gKmt2bSwgbG9uZyBleHQpCj4gICAgICAgICBjYXNlIEtWTV9D
QVBfVk1fR1BBX0JJVFM6Cj4gICAgICAgICAgICAgICAgIHIgPSBrdm1fcmlzY3ZfZ3N0YWdlX2dw
YV9iaXRzKGt2bS0+YXJjaC5wZ2RfbGV2ZWxzKTsKPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4g
KyAgICAgICBjYXNlIEtWTV9DQVBfUklTQ1ZfU0VUX0hHQVRQX01PREU6Cj4gKyAgICAgICAgICAg
ICAgIHIgPSBrdm1fcmlzY3ZfZ2V0X2hnYXRwX21vZGVfbWFzaygpOwo+ICsgICAgICAgICAgICAg
ICBicmVhazsKCkludHJvZHVjaW5nIGEgbmV3IFJJU0MtViBjYXBhYmlsaXR5IGxvb2tzIGEgYml0
IGNvbXBsZXguCkluc3RlYWQgb2YgS1ZNX0NBUF9SSVNDVl9TRVRfSEdBVFBfTU9ERSwgd2UgY2Fu
CnNpbXBseSByZS11c2UgS1ZNX0NBUF9WTV9HUEFfQklUUy4KClRoZSBrdm1fdm1faW9jdGxfY2hl
Y2tfZXh0ZW5zaW9uKCkgZm9yIEtWTV9DQVBfVk1fR1BBX0JJVFMKcmV0dXJuIG51bWJlciBvZiBH
UEEgYml0cyB3aGljaCBpbi1kaXJlY3RseSBpbXBsaWVzIHRoZSB1bmRlcmx5aW5nCmhnYXRwLk1P
REUuIEFzIHdlIGtub3csIGlmIGl0IHJldHVybiA1OSBiaXRzIEdQQSB0aGVuIGl0IG1lYW5zClN2
NTd4NCBpcyB0aGUgc2VsZWN0ZWQgaGdhdHAuTU9ERSBhbmQgU3Y0OHg0IGFuZCBTdjM5eDQgbW9k
ZXMKYXJlIGFsc28gc3VwcG9ydGVkIGFzLXBlciBSSVNDLVYgcHJpdmlsZWdlZCBzcGVjaWZpY2F0
aW9uLgoKVGhlIGt2bV92bV9pb2N0bF9lbmFibGVfY2FwKCkgZm9yIEtWTV9DQVBfVk1fR1BBX0JJ
VFMKd2lsbCB0YWtlIHRoZSBkZXNpcmVkIG51bWJlciBvZiBHUEEgYml0cyBhbmQgZG93bnNpemUg
dGhlIHNlbGVjdGVkCmhnYXRwLk1PREUuIEZvciBleGFtcGxlLCBpZiB1c2VyLXNwYWNlIGFzayBH
UEEgYml0cyA8PSA1MCBhbmQKR1BBIGJpdHMgPiA0MSB0aGVuIHdlIHNlbGVjdCBTdjQ4eDQuIElm
IHVzZXItc3BhY2UgYXNrIEdQQQpiaXRzIDw9IDQxIHRoZW4gd2Ugc2VsZWN0IFN2Mzl4NC4gSWYg
dXNlci1zcGFjZSBhc2sgR1BBIGJpdHMgPD0gNTkKYW5kIEdQQSBiaXRzID4gNTAgdGhlbiB3ZSBz
ZWxlY3QgU3Y1N3g0LgoKPiAgICAgICAgIGRlZmF1bHQ6Cj4gICAgICAgICAgICAgICAgIHIgPSAw
Owo+ICAgICAgICAgICAgICAgICBicmVhazsKPiBAQCAtMjExLDEyICsyMTQsMjMgQEAgaW50IGt2
bV92bV9pb2N0bF9jaGVja19leHRlbnNpb24oc3RydWN0IGt2bSAqa3ZtLCBsb25nIGV4dCkKPgo+
ICBpbnQga3ZtX3ZtX2lvY3RsX2VuYWJsZV9jYXAoc3RydWN0IGt2bSAqa3ZtLCBzdHJ1Y3Qga3Zt
X2VuYWJsZV9jYXAgKmNhcCkKPiAgewo+ICsgICAgICAgaWYgKGNhcC0+ZmxhZ3MpCj4gKyAgICAg
ICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICsKPiAgICAgICAgIHN3aXRjaCAoY2FwLT5jYXAp
IHsKPiAgICAgICAgIGNhc2UgS1ZNX0NBUF9SSVNDVl9NUF9TVEFURV9SRVNFVDoKPiAtICAgICAg
ICAgICAgICAgaWYgKGNhcC0+ZmxhZ3MpCj4gLSAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJu
IC1FSU5WQUw7Cj4gICAgICAgICAgICAgICAgIGt2bS0+YXJjaC5tcF9zdGF0ZV9yZXNldCA9IHRy
dWU7Cj4gICAgICAgICAgICAgICAgIHJldHVybiAwOwo+ICsgICAgICAgY2FzZSBLVk1fQ0FQX1JJ
U0NWX1NFVF9IR0FUUF9NT0RFOgo+ICsgICAgICAgICAgICAgICBpZiAoIWt2bV9yaXNjdl9oZ2F0
cF9tb2RlX2lzX3ZhbGlkKGNhcC0+YXJnc1swXSkpCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
cmV0dXJuIC1FSU5WQUw7Cj4gKwo+ICsgICAgICAgICAgICAgICBpZiAoa3ZtLT5jcmVhdGVkX3Zj
cHVzIHx8ICFrdm1fYXJlX2FsbF9tZW1zbG90c19lbXB0eShrdm0pKQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIHJldHVybiAtRUJVU1k7Cj4gKyNpZmRlZiBDT05GSUdfNjRCSVQKPiArICAgICAg
ICAgICAgICAga3ZtLT5hcmNoLnBnZF9sZXZlbHMgPSAzICsgY2FwLT5hcmdzWzBdIC0gSEdBVFBf
TU9ERV9TVjM5WDQ7Cj4gKyNlbmRpZgo+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsKPiAgICAg
ICAgIGRlZmF1bHQ6Cj4gICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICAgICAgICAg
fQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgva3ZtLmggYi9pbmNsdWRlL3VhcGkv
bGludXgva3ZtLmgKPiBpbmRleCA4MDM2NGQ0ZGJlYmIuLmE3NGE4MGZkNDA0NiAxMDA2NDQKPiAt
LS0gYS9pbmNsdWRlL3VhcGkvbGludXgva3ZtLmgKPiArKysgYi9pbmNsdWRlL3VhcGkvbGludXgv
a3ZtLmgKPiBAQCAtOTg5LDYgKzk4OSw3IEBAIHN0cnVjdCBrdm1fZW5hYmxlX2NhcCB7Cj4gICNk
ZWZpbmUgS1ZNX0NBUF9BUk1fU0VBX1RPX1VTRVIgMjQ1Cj4gICNkZWZpbmUgS1ZNX0NBUF9TMzkw
X1VTRVJfT1BFUkVYRUMgMjQ2Cj4gICNkZWZpbmUgS1ZNX0NBUF9TMzkwX0tFWU9QIDI0Nwo+ICsj
ZGVmaW5lIEtWTV9DQVBfUklTQ1ZfU0VUX0hHQVRQX01PREUgMjQ4Cj4KPiAgc3RydWN0IGt2bV9p
cnFfcm91dGluZ19pcnFjaGlwIHsKPiAgICAgICAgIF9fdTMyIGlycWNoaXA7Cj4gLS0KPiAyLjUw
LjEKPgoKUmVnYXJkcywKQW51cAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9rdm0tcmlzY3YK
