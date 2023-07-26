From: Haibo Xu <xiaobo55x@gmail.com>
Date: Wed, 26 Jul 2023 09:17:18 +0800
Subject: [PATCH v6 06/13] KVM: arm64: selftests: Split get-reg-list test code
In-Reply-To: <20230725-f5cf47c63abd8673d22b4936@orel>
References: <cover.1690273969.git.haibo1.xu@intel.com> <1f25f27d1316bc91e1e31cd3d50a1d20f696759a.1690273969.git.haibo1.xu@intel.com>
 <CAJve8okJ-HYpsOrqH4Zvn7OBtwXWa4JumC+ZsMfHKB-deVYd2A@mail.gmail.com> <20230725-f5cf47c63abd8673d22b4936@orel>
Message-ID: <CAJve8ony79xS2qPtdex+tSSEP2uTebzBRExUob9kOiwxpC7PEg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 25, 2023 at 8:44?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Tue, Jul 25, 2023 at 04:50:36PM +0800, Haibo Xu wrote:
> > On Tue, Jul 25, 2023 at 4:37?PM Haibo Xu <haibo1.xu@intel.com> wrote:
> > >
> > > From: Andrew Jones <ajones@ventanamicro.com>
> > >
> > > Split the arch-neutral test code out of aarch64/get-reg-list.c into
> > > get-reg-list.c. To do this we invent a new make variable
> > > $(SPLIT_TESTS) which expects common parts to be in the KVM selftests
> > > root and the counterparts to have the same name, but be in
> > > $(ARCH_DIR).
> > >
> > > There's still some work to be done to de-aarch64 the common
> > > get-reg-list.c, but we leave that to the next patch to avoid
> > > modifying too much code while moving it.
> > >
> > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> > > ---
> > >  tools/testing/selftests/kvm/Makefile          |  12 +-
> > >  .../selftests/kvm/aarch64/get-reg-list.c      | 367 +----------------
> > >  tools/testing/selftests/kvm/get-reg-list.c    | 377 ++++++++++++++++++
> > >  3 files changed, 398 insertions(+), 358 deletions(-)
> > >  create mode 100644 tools/testing/selftests/kvm/get-reg-list.c
> > >
> > > diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
> > > index c692cc86e7da..95f180e711d5 100644
> > > --- a/tools/testing/selftests/kvm/Makefile
> > > +++ b/tools/testing/selftests/kvm/Makefile
> > > @@ -140,7 +140,6 @@ TEST_GEN_PROGS_EXTENDED_x86_64 += x86_64/nx_huge_pages_test
> > >  TEST_GEN_PROGS_aarch64 += aarch64/aarch32_id_regs
> > >  TEST_GEN_PROGS_aarch64 += aarch64/arch_timer
> > >  TEST_GEN_PROGS_aarch64 += aarch64/debug-exceptions
> > > -TEST_GEN_PROGS_aarch64 += aarch64/get-reg-list
> > >  TEST_GEN_PROGS_aarch64 += aarch64/hypercalls
> > >  TEST_GEN_PROGS_aarch64 += aarch64/page_fault_test
> > >  TEST_GEN_PROGS_aarch64 += aarch64/psci_test
> > > @@ -152,6 +151,7 @@ TEST_GEN_PROGS_aarch64 += access_tracking_perf_test
> > >  TEST_GEN_PROGS_aarch64 += demand_paging_test
> > >  TEST_GEN_PROGS_aarch64 += dirty_log_test
> > >  TEST_GEN_PROGS_aarch64 += dirty_log_perf_test
> > > +TEST_GEN_PROGS_aarch64 += get-reg-list
> > >  TEST_GEN_PROGS_aarch64 += kvm_create_max_vcpus
> > >  TEST_GEN_PROGS_aarch64 += kvm_page_table_test
> > >  TEST_GEN_PROGS_aarch64 += memslot_modification_stress_test
> > > @@ -181,6 +181,8 @@ TEST_GEN_PROGS_riscv += kvm_page_table_test
> > >  TEST_GEN_PROGS_riscv += set_memory_region_test
> > >  TEST_GEN_PROGS_riscv += kvm_binary_stats_test
> > >
> > > +SPLIT_TESTS += get-reg-list
> > > +
> > >  TEST_PROGS += $(TEST_PROGS_$(ARCH_DIR))
> > >  TEST_GEN_PROGS += $(TEST_GEN_PROGS_$(ARCH_DIR))
> > >  TEST_GEN_PROGS_EXTENDED += $(TEST_GEN_PROGS_EXTENDED_$(ARCH_DIR))
> > > @@ -228,11 +230,14 @@ LIBKVM_C_OBJ := $(patsubst %.c, $(OUTPUT)/%.o, $(LIBKVM_C))
> > >  LIBKVM_S_OBJ := $(patsubst %.S, $(OUTPUT)/%.o, $(LIBKVM_S))
> > >  LIBKVM_STRING_OBJ := $(patsubst %.c, $(OUTPUT)/%.o, $(LIBKVM_STRING))
> > >  LIBKVM_OBJS = $(LIBKVM_C_OBJ) $(LIBKVM_S_OBJ) $(LIBKVM_STRING_OBJ)
> > > +SPLIT_TESTS_TARGETS := $(patsubst %, $(OUTPUT)/%, $(SPLIT_TESTS))
> > > +SPLIT_TESTS_OBJS := $(patsubst %, $(ARCH_DIR)/%.o, $(SPLIT_TESTS))
> > >
> > >  TEST_GEN_OBJ = $(patsubst %, %.o, $(TEST_GEN_PROGS))
> > >  TEST_GEN_OBJ += $(patsubst %, %.o, $(TEST_GEN_PROGS_EXTENDED))
> > >  TEST_DEP_FILES = $(patsubst %.o, %.d, $(TEST_GEN_OBJ))
> > >  TEST_DEP_FILES += $(patsubst %.o, %.d, $(LIBKVM_OBJS))
> > > +TEST_DEP_FILES += $(patsubst %.o, %.d, $(SPLIT_TESTS_OBJS))
> > >  -include $(TEST_DEP_FILES)
> > >
> > >  $(TEST_GEN_PROGS) $(TEST_GEN_PROGS_EXTENDED): %: %.o
> > > @@ -240,7 +245,10 @@ $(TEST_GEN_PROGS) $(TEST_GEN_PROGS_EXTENDED): %: %.o
> > >  $(TEST_GEN_OBJ): $(OUTPUT)/%.o: %.c
> > >         $(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
> > >
> > > -EXTRA_CLEAN += $(LIBKVM_OBJS) $(TEST_DEP_FILES) $(TEST_GEN_OBJ) cscope.*
> > > +$(SPLIT_TESTS_TARGETS): %: %.o $(SPLIT_TESTS_OBJS)
> > > +       $(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH) $^ $(LDLIBS) -o $@
> > > +
> > > +EXTRA_CLEAN += $(LIBKVM_OBJS) $(TEST_DEP_FILES) $(TEST_GEN_OBJ) $(SPLIT_TESTS_OBJS) cscope.*
> > >
> > >  x := $(shell mkdir -p $(sort $(dir $(LIBKVM_C_OBJ) $(LIBKVM_S_OBJ))))
> > >  $(LIBKVM_C_OBJ): $(OUTPUT)/%.o: %.c
> >
> > Hi @Andrew Jones,
> >
> > After rebasing to v6.5-rc3, some changes are needed to the SPLIT_TESTS
> > target, or the make would fail.
> > Please help have a look.
> >
>
> I took a look and then remembered why I hate looking at Makefiles... I
> guess it's fine, but it's a pity we need to repeat the $(CC) line.
>

Yes, I can't figure out a way to avoid the repeat $(CC) line.
Let's see whether there is any suggestion from the community that can
optimize this.

> Thanks,
> drew

