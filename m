From: John Hubbard <jhubbard@nvidia.com>
Date: Wed, 8 May 2024 18:03:58 -0700
Subject: [PATCH v2 3/5] selftests: Include KHDR_INCLUDES in Makefile
In-Reply-To: <CAG4es9XPLhHhH-Hfm3_m5zLLtiB1zme8pAazMhErMpHqJcAMmw@mail.gmail.com>
References: <20240507214254.2787305-1-edliaw@google.com>
 <20240507214254.2787305-4-edliaw@google.com>
 <ec8ab737-a841-4cd5-8ec1-e0a777744262@nvidia.com>
 <CAG4es9XPLhHhH-Hfm3_m5zLLtiB1zme8pAazMhErMpHqJcAMmw@mail.gmail.com>
Message-ID: <e2b35876-db4d-4646-908f-1e7da1814d1c@nvidia.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 5/8/24 5:29 PM, Edward Liaw wrote:
> On Wed, May 8, 2024 at 2:41?PM John Hubbard <jhubbard@nvidia.com> wrote:
>> On 5/7/24 2:38 PM, Edward Liaw wrote:
...
>> Seeing as how these all include lib.mk, and all use CFLAGS, is there
>> any reason not to simply fix this in lib.mk instead? Like this:
>>
>> diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
>> index 7fa4a96e26ed..df72610e0d2b 100644
>> --- a/tools/testing/selftests/lib.mk
>> +++ b/tools/testing/selftests/lib.mk
>> @@ -170,6 +170,8 @@ clean: $(if $(TEST_GEN_MODS_DIR),clean_mods_dir)
>>    CFLAGS += $(USERCFLAGS)
>>    LDFLAGS += $(USERLDFLAGS)
>>
>> +CFLAGS += $(KHDR_INCLUDES)
>> +
>>    # When make O= with kselftest target from main level
>>    # the following aren't defined.
>>    #
>>
> 
> Or how about just adding -D_GNU_SOURCE to CFLAGS then?

Yes, that would also work. I think either one would be good.


thanks,
-- 
John Hubbard
NVIDIA


